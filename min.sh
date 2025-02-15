#!/bin/bash

set -e

if ! command -v python3.12 &>/dev/null; then
  echo "Python 3.12 is not installed. Please install it first."
  exit 1
fi

echo "Creating virtual environment with Python 3.12..."
python3.12 -m venv venv

echo "Activating virtual environment..."
source venv/bin/activate

echo "Upgrading pip..."
pip install --upgrade pip

if [ ! -f "requirements.txt" ]; then
  echo "requirements.txt not found. Please provide one in the current directory."
  deactivate
  rm -rf venv
  exit 1
fi

echo "Installing dependencies from requirements.txt..."
pip install -r requirements.txt

if [ ! -f "min.py" ]; then
  echo "min.py not found. Please provide the script in the current directory."
  deactivate
  rm -rf venv
  exit 1
fi

echo "Running min.py..."
python min.py

echo "Deactivating virtual environment..."
deactivate

echo "Cleaning up the virtual environment..."
rm -rf venv

echo "Setup, execution, and cleanup complete!"
