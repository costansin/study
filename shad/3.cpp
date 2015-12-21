#include <iostream>
#include <algorithm>
#include <vector>

using namespace std;

template <typename T> void reverse (T begin, T end){
  while (begin<end){
    swap(*begin, *end);
  }
}

template <typename T> void rotate (T begin, T end, int k){
  T ptr = begin;
  for (int i=0; i<k; i++, ptr++);
  reverse(begin, ptr);
  reverse(ptr, end);
  reverse(begin, end);  
}

int main(){
  int M[10] = {1,2,3,4,5,6,7,8,9};
  rotate <&(M[3]),&(M[9]),3>;
  return 0;
}
