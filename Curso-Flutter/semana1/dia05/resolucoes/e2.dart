import 'dart:async';

Stream<int> countDownStream(int max) async* {
    for(int i = max; i>=0; i--) {
        yield i;
        await Future.delayed(const Duration(milliseconds: 1000));
    }
}
void main() {
    final Stream<int> numberStream = countDownStream(5);

    numberStream.listen((count) { 
        print(count);
    });
}