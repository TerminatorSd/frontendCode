#include <iostream>
#include <vector>
#include <string>
#include <cmath>
#include <map>
#include <queue>
#include <list>
#include <algorithm>
 
using namespace std;

typedef struct TreeNode {
  int val;
  struct TreeNode *left;
  struct TreeNode *right;
  TreeNode(int x) : val(x), left(NULL), right(NULL) {}
}BiTree;
// 二叉树深度
int maxDepth(BiTree *root) {
  if(root == NULL) {
    return 0;
  }
  else {
    return max(maxDepth(root->left), maxDepth(root->right)) + 1;
  }
}
// 初始化根
BiTree* initTree() {
  BiTree* root = (BiTree *) malloc (sizeof(BiTree));
  if(!root) {
    cout<<"初始化失败！"<<endl;
    return NULL;
  } else {
    return root;
  }
}
// 先序遍历
void preOrder(TreeNode *root, vector<int> &result)  
{  
    if (root)  
    {  
        result.push_back(root->val);  
        preOrder(root->left, result);  
        preOrder(root->right, result);  
    }  
} 
// 中序遍历
void cenOrder(TreeNode* root, std::vector<int> &result) {
  if(root) {
    cenOrder(root->left, result);
    result.push_back(root->val);
    cenOrder(root->right, result);
  }
}
// 输出vector int
void traverse(vector<int> nums)  
{  
    vector<int>::size_type size = nums.size();  
    for (size_t i = 0; i < size; i++)  
    {  
        cout << nums[i] << ' ';  
    }  
    cout << endl;  
}  
// 最小路径
int minDepth(BiTree* root) {
  if(root == NULL) return 0;
  int left = minDepth(root->left);
  int right = minDepth(root->right);
  if(left == 0 || right == 0) {
    return left + right + 1;
  }
  return min(left, right) + 1;
}
// 使用数组初始化二叉树
BiTree* initBTree(int elements[], int size)  
{  
    if (size < 1)  
    {  
        return NULL;  
    }  
    //动态申请size大小的指针数组  
    BiTree **nodes = new BiTree* [size];  
    //将int数据转换为BiTree节点  
    for (int i = 0; i < size; i++)  
    {  
        if (elements[i] == 0)  
        {  
            nodes[i] = NULL;  
        }  
        else  
        {  
            nodes[i] = new BiTree(elements[i]);  
        }  
    }  
    queue<BiTree*> nodeQueue;  
    nodeQueue.push(nodes[0]);  
  
    BiTree *node;  
    int index = 1;  
    while (index < size)  
    {  
        node = nodeQueue.front();  
        nodeQueue.pop();  
        nodeQueue.push(nodes[index++]);  
        node->left = nodeQueue.back();  
        nodeQueue.push(nodes[index++]);  
        node->right = nodeQueue.back();  
    }  
    return nodes[0];  
}  

int main() {
  int a[] = {1, 2, 3, 4, 0, 5, 6, 0, 7};
  vector<int> preResult;  
  vector<int> cenResult;  
  BiTree* root = initBTree(a, 9);
  // preOrder(root, preResult);
  // cenOrder(root, cenResult);
  // traverse(preResult);
  // traverse(cenResult);
  int height = minDepth(root);
  cout<<height<<endl;
  return 0;
}
