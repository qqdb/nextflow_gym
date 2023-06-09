// map <<<<<
// val_ch = Channel.of(1..5)
// val_ch.view()
// val_ch.map{it * it}.view()


// ifEmpty <<<<<
// Channel.of(1..5).ifEmpty('It is empty').view()
// Channel.empty().ifEmpty('It is empty').view()
// Channel.fromPath('../input/*.txt').ifEmpty('It is empty').view()


// subscribe <<<<<
// val_ch = Channel.of('A'..'E')
// 匿名函数
// val_ch.subscribe { println "Choice: $it" }
// 带参数类型和形参的函数
// val_ch.subscribe {
//     String str ->
//         println "It is $str; len: ${str.size()}"
// }
// handler
// val_ch.subscribe onNext: { println "No. ${it}" }, onComplete: { println "Done"}

// set <<<<<
// Channel.of(10, 20, 30).set { my_channel }
// 等同于
// my_channel = Channel.of(10, 20, 30)


// view <<<<<
// val_ch = Channel.of('A'..'E')
// val_ch.view()

// val_ch.view(newLine: false)

// num_ch = Channel.of(1..5)
// num_ch.map {[it, it*it]}
// .view {num, sqr -> "Number: $num, Square: $sqr"}


// filter <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
// val_ch = Channel
//     .of( 'a', 'b', 'aa', 'bc', 3, 4.5 )
// val_ch.filter( ~/^a.*/ ).view()

// val_ch.filter( String ).view()

// num_ch = Channel.of(1,2,3,4,5)
// num_ch.filter {it % 2 == 0}.view()


// randomSample <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
// Channel
//     .of(1..1000)
//     .randomSample(5)
//     .view()

// Channel
//     .of( 1..1000 )
//     .randomSample( 5, 666 )
//     .view()

// take <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
// Channel
//     .of(1..10)
//     .take(5)
//     .view()



// unique <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
// Channel
//     .of(1,2,3,1,2,3,4,5)
//     .unique()
//     .view()


// combine <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
// num_ch = Channel.of(1,2,3)
// group_ch = Channel.of('KO', 'WT')
// num_ch
//     .combine(group_ch)
//     .view()

num_ch = Channel.of(["cat", 1], ["dog", 3])
group_ch = Channel.of(['A', 2], ['B', 1], ['C', 2], ['D', 3])
num_ch
    .combine(group_ch, by: 1)
    .view()