#!/bin/bash
# Script to measure ZSH startup time

echo "=== ZSH Startup Time Measurement ==="
echo ""

# Method 1: Simple time measurement (10 runs)
echo "Method 1: Average startup time (10 runs):"
total_time=0
for i in {1..10}; do
    start_time=$(date +%s%N)
    zsh -i -c exit
    end_time=$(date +%s%N)
    elapsed=$((($end_time - $start_time) / 1000000))
    total_time=$(($total_time + $elapsed))
    echo "  Run $i: ${elapsed}ms"
done
average=$(($total_time / 10))
echo "Average: ${average}ms"
echo ""

# Method 2: Using zsh's built-in time
echo "Method 2: Using ZSH built-in time:"
time zsh -i -c exit
echo ""

# Method 3: Detailed profiling with zprof
echo "Method 3: Detailed profiling (zprof):"
echo "Creating temporary profiling script..."
cat > /tmp/zsh_profile_test.zsh << 'EOF'
zmodload zsh/zprof
source ~/.zsh/init.zsh
zprof
EOF

zsh /tmp/zsh_profile_test.zsh > /tmp/zsh_profile_output.txt 2>&1
echo "Top 10 slowest operations:"
head -n 30 /tmp/zsh_profile_output.txt

# Clean up
rm -f /tmp/zsh_profile_test.zsh /tmp/zsh_profile_output.txt

echo ""
echo "=== Tips for optimization ==="
echo "1. Comment out unused plugins in plugins.zsh"
echo "2. Lazy-load heavy completions"
echo "3. Use async loading for slow operations"
echo "4. Check for slow external commands in your config"