/*
 * @Author:   shaoDong
 * @Version:  1.0
 * @DateTime: 2018-07-17 10:33:04
 * @Description: 判断链表是否有环，创建单链表
 */

#include <cstdlib>
#include <iostream>

using namespace std;

// struct 是一个特殊的类，可以包含构造函数
struct ListNode {
    int val;
    ListNode *next;
    // 初始化列表
    ListNode(int x) : val(x), next(NULL) {}
};

ListNode *initList() {
    ListNode *p;

    // 堆可申请空间，栈存放临时变量
    ListNode *head = new ListNode(1);
    p = head;

    for(int i = 0; i < 5; i++) {
        ListNode *temp = new ListNode(i);
        p->next = temp;
        p = p->next;
    }

    p = head;
    return p;
}

int printList(ListNode *head) {
    ListNode *p = head;
    while(p) {
        cout<<p->val<<endl;
        p = p->next;
    }
    return 0;
}

bool hasCycle(ListNode *head) {
    ListNode *p = head;
    ListNode *q = head;
    while(p != NULL && q != NULL && q->next != NULL) {
        p = p->next;
        q = q->next->next;
        if (p == q) {
            return true;
        }
    }
    return false;
}

int main(int argc, char const *argv[]) {
    ListNode *head = initList();
    bool yes = hasCycle(head);
    cout<<yes<<endl;
    return 0;
}
