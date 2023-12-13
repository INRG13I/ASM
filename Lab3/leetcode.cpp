#include <iostream>

using namespace std;

bool isPalindrome(int x) {
        int v[9];
        int i=0;
        while(x){
            v[i++]=x%10;
            x/=10;
        }

        for(int j=0;j<i/2;j++){
            if(v[j]!=v[i-j]){
                return false;
            }
        }
        return true;
    }

void main(){
    cout<<isPalindrome(1331);
}