#! /usr/bin/env python

import re

from lab.parser import Parser

def main():
    parser = Parser()
    parser.add_pattern("expanded", r".+ Expanded (\d+) state\(s\).\n", type=int)
    parser.add_pattern("generated", r".+ Generated (\d+) state\(s\).\n", type=int)
    parser.add_pattern("maximum_effective_width", r"Maximum effective width: (\d+)\n", type=int)
    parser.add_pattern("average_effective_width", r"Average effective width: (.+)\n", type=float)

    parser.parse()

if __name__ == "__main__":
    main()
