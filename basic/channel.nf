// from ++++++++++++++++++++++++++++++++++++++++++++++++++
// ch = Channel.from(1,2,3,6,7,8)
// ch.view()

// ch = Channel.from('A'..'E')
// ch.view()

// ch = Channel.from([1,2,3,6,7,8])
// ch.view()

// ch = Channel.from([1, 2], [5,6], [7,9])
// ch.view()


// fromList ++++++++++++++++++++++++++++++++++++++++++++++++++
// list_ch = Channel
//     .fromList( ['a', 'b', 'c', 'd'] )
//     .view { "value: $it" }


// of ++++++++++++++++++++++++++++++++++++++++++++++++++++++
// of_ch = Channel
//     .of(1..5, 'X', 'Y')
//     .view()


// value ++++++++++++++++++++++++++++++++++++++++++++++++++++++
// val_ch = Channel.value()
// val_ch.view()
// val_ch = Channel.value('There')
// val_ch.view()
// val_ch = Channel.value([1,2,3])
// val_ch.view()


// ----------------------------------------------------------------------------------
// fromPath +++++++++++++++++++++++++++++++++++++++++++++++++++
// files_ch = Channel.fromPath( '../input/*.fq' )
// files_ch.view()

// multi path
// files_ch = Channel.fromPath( ['../input/*.fq', '../input/mapping/*.sam'] )
// files_ch.view()

// check exists
// files_ch = Channel.fromPath( '../input/*.fq', checkIfExists: true)
// files_ch.view()

// To include hidden files
// files_ch = Channel.fromPath( '../input/*.fq', hidden: true )
// files_ch.view()

// return
// files_ch = Channel.fromPath( '../input/*.fq', type: 'file' ) // return files
// files_ch = Channel.fromPath( '../input/*.fq', type: 'path' ) // return path
// files_ch = Channel.fromPath( '../input/*.fq', type: 'any' ) // return files and path
// files_ch.view()


// fromFilePairs ++++++++++++++++++++++++++++++++++++++++++++++++++++++
// filepair_ch = Channel.fromFilePairs('../input/sample*_{1,2}.fq')
// filepair_ch.view()

// filepair_ch = Channel.fromFilePairs('../input/sample*', size: -1) {file -> file.extension}
// .view {extension, files -> "Files with the extension $extension are $files"}


// fromSRA
// sra_ch = Channel.fromSRA('PRJNA814275')
// sra_ch.view()

// sra_ch = Channel.fromSRA(['ERR908507', 'ERR908506', 'ERR908505']).view()
// sra_ch.view()


// watchPath ++++++++++++++++++++++++++++++++++++++++++++++++++
// notion: use until
// wp_ch = Channel
//     .watchPath( '../input/*.fq' )
//     .subscribe { println "Fasta file: $it" }

// wp_ch = Channel
//     .watchPath( '../input/*.fq', 'create,modify' )
//     .subscribe { println "File created or modified: $it" }