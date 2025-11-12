#!/bin/bash
# Fix slidev-addon-cpp-runner to suppress format warnings

FILE="node_modules/.pnpm/slidev-addon-cpp-runner@0.1.2/node_modules/slidev-addon-cpp-runner/setup/code-runners.ts"

if [ -f "$FILE" ]; then
    sed -i "s|const COMMON_FLAGS         = '-Wall -Wextra -pedantic -pthread -pedantic-errors';|const COMMON_FLAGS         = '-Wall -Wextra -pedantic -pthread -pedantic-errors -Wno-format -Wno-format-security -Wno-format-extra-args';|g" "$FILE"
    echo "✓ Fixed cpp-runner flags"
else
    echo "✗ File not found: $FILE"
fi
