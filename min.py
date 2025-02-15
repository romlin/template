import rcssmin
import rjsmin


def minify_file(input_file, output_file, minifier):
    """Minifies the input file and writes the result to the output file."""
    with open(input_file, 'r') as infile:
        content = infile.read()
    minified_content = minifier(content)
    with open(output_file, 'w') as outfile:
        outfile.write(minified_content)


minify_file('app.css', 'app.min.css', rcssmin.cssmin)
minify_file('app.js', 'app.min.js', rjsmin.jsmin)
