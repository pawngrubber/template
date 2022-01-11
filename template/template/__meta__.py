# `name` is the name of the package as used for `pip install package`
name = "template"

# `path` is the name of the package for `import package`
path = name.lower().replace("-", "_").replace(" ", "_")

# Your version number should follow https://python.org/dev/peps/pep-0440 and
# https://semver.org
version = "1.0.dev0"
author = "Paul Terwilliger"
author_email = "paul.terwilliger@chess.com"
description = "template"  # One-liner
url = ""  # your project homepage
license = "None"  # See https://choosealicense.com
