#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
#include <string>

using namespace std;

class node{
    public:
    string data;
    node* next;    
};

void append(node** head_ref , string data){
    node* new_node = new node();
    node* last = *head_ref;
    
    new_node->data = data;
    
    if(*head_ref == NULL){
        *head_ref =new_node;
        return;
    }
    while(last->next !=0){
        last = last->next;
    }
    last->next = new_node;
    return;
}
void deletenode(node** head_ref , string data){
    node* temp = *head_ref;
    node* prev = NULL;
    
    if(temp != NULL && temp->data == data){
        *head_ref =temp->next;
        delete temp;
        return;
    }
    else{
        while(temp != NULL && temp->data != data){
            prev = temp;
            temp = temp->next;
        }
        if(temp == NULL)
            return;
        
        prev->next = temp->next;
        
        delete temp;
    }
}
void printlist(node* node){
    while(node != NULL){
        cout << node->data << endl;
        node = node->next;
    }
}


int main() {
    /* Enter your code here. Read input from STDIN. Print output to STDOUT */  
    
    node* head = NULL;
    
    string g1,g2,g3,g4,g5,g6;
    
    getline(cin , g1);
    getline(cin , g2);
    getline(cin , g3);
    getline(cin , g4);
    getline(cin , g5);
    getline(cin , g6);
    
    append(&head , g1);
    append(&head , g2);
    append(&head , g3);
    append(&head , g4);
    append(&head , g5);
    append(&head , g6);
    
    int n;
    cin >> n;
    while(n>0){
        string s1;
        getline(cin,s1);
        cout << s1 << endl;
        deletenode(&head , s1);
        n--;
    }
    
    printlist(head);
    
    
    return 0;
}




