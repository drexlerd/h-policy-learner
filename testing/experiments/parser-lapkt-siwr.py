#! /usr/bin/env python

import re

from lab.parser import Parser


def main():
    parser = Parser()
    parser.add_pattern("expanded", r"Nodes expanded during search: (\d+)\n", type=int)
    parser.add_pattern("generated", r"Nodes generated during search: (\d+)\n", type=int)
    parser.add_pattern("maximum_effective_width", r"Max ef. width: (\d+)\n", type=int)
    parser.add_pattern("average_effective_width", r"Average ef. width: (.+)\n", type=float)
    parser.parse()

if __name__ == "__main__":
    main()
