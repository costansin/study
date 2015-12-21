#include <iostream>
#include <algorithm>
#include <vector>

using namespace std;

template <typename T> void revrse (T begin, T end){
  while (begin<end){
    std::swap(*begin, *end);
    begin++;
    end--;
  }
}

template <typename T> void RotateK (T begin, T end, int k){
  T ptr;
  --end;
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

int main(){
  int M[5] = {1,2,3,4,5};//,4,5,6,7,8,9};
  RotateK (&(M[0]),&(M[4]),3);
  for (int i=0; i<5; i++){cout<<M[i]<<" ";}
  cout<<endl;
  vector<int> V;
  for (int i=1; i<6; i++) {V.push_back(i);}
  RotateK(V.begin(),V.end(),1);
  for (int i=0; i<5; i++){cout<<V[i]<<" ";}
  return 0;
}
