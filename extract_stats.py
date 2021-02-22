import os 
import json 
import pandas as pd
import shelve
import sys
from tabulate import tabulate

if not os.path.exists("results"):
    os.mkdir("results")

DATASET = "afhq"
OUTPUT_PATH = "results/tables.md"

shelf = shelve.open('results/cache_extract_stats', 'c')
steps_to_skip = int(sys.argv[1]) if len(sys.argv) > 1 else 0

def step(f):
    global steps_to_skip
    if steps_to_skip > 0:
        steps_to_skip -= 1
    else:
        f()

# This is to fix the number ordering as otherwise 128 goes before 64
exprs = sorted(os.listdir("expr"), key=lambda s: sum([10**i*ord(c) for i, c in enumerate(reversed(s))]))

@step
def extract_results():
    print("👉 Extracting results as json")
    results = {}

    for expr in exprs:
        print(expr)
        results[expr] = {}
        path = f"expr/{expr}/eval/{DATASET}"
        for result in os.listdir(path):
            if result.endswith(".json"):
                results[expr][result] = json.loads(open(path + "/" + result, "r").read())
        
    shelf['results'] = results

@step
def make_frames():
    print("👉 Transposing data into frames")
    results = shelf['results']

    frames = {}
    measurements = set.union(*[set(expr.keys()) for expr in results.values()])
    for measurement in measurements:
        print(measurement)
        frames[measurement] = pd.DataFrame([
            { k.split("/")[-1]:v for k, v in results[expr][measurement].items() } 
                for expr in exprs
        ], exprs)
    
    shelf['frames'] = frames

@step
def makes_tables():
    print("👉 Making tables")
    frames = shelf['frames']
    tabulate.PRESERVE_WHITESPACE = True

    file = open(OUTPUT_PATH, "w+")

    plots = {}
    for name, frame in sorted(frames.items(), key=lambda p: p[0]):
        print(name)
        print("###", name.split(".")[0], file=file)
        print(tabulate(
            frame, 
            tablefmt='github', 
            headers="keys",
            floatfmt=".3f"
        ), file=file)
        print("<br/><br/>", file=file)

    print("👍 Created", OUTPUT_PATH)
    shelf['plots'] = file.read()