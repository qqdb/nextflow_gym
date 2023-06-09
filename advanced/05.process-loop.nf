nextflow.preview.recursion=true

params.data = "$baseDir/data/hello.txt"

process foo {
  input:
    path 'input.txt'
  output:
    path 'result.txt'
  script:
    """
    cat input.txt > result.txt
    echo "Task ${task.index} was here" >> result.txt
    """
}

workflow {
  // perform a fixed number of iterations
  foo
    .recurse(file(params.data))
    .times(10)

  // iterate until some condition is satisfied
//   foo
//     .recurse(file(params.data))
//     .until { it -> it.size() > 100 }

  foo
    .out
    .view(it -> it.text)
}