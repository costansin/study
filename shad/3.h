#include <algorithm>

template <typename T> void revrse (T begin, T end){
  while (begin<end){
    std::swap(*begin, *end);
    begin++;
    end--;
  }
}

template <typename T> void RotateK (T begin, T end, int k){
  --end;
  T ptr;
  if (k<0) {
    ptr = begin;
    for (int i=1; i<-k; ++i){
        ++ptr;
        if (ptr>end) ptr = begin;
    }
  }
  else {
    ptr = end;
    for (int i=0; i<k; ++i){
        --ptr;
        if (ptr<begin) ptr = end;
    }
  }
  revrse(begin, ptr);
  revrse(++ptr, end);
  revrse(begin, end);
}