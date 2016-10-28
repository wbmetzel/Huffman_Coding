
#ifndef _BSTREE__
#define _BSTREE__

#include <iostream>

using namespace std;

template <class BaseType>
struct Node
{
	BaseType val;
	Node *left, *right;

	Node(const BaseType &val)
	{
		this->val = val;
		this->left = nullptr;
		this->right = nullptr;
	}
};

template <class BaseType>
class BSTree
{
private:
	Node<BaseType> *root;
	void inorder(const Node<BaseType> *current);
	void preorder(const Node<BaseType> *current);
	void postorder(const Node<BaseType> *current);
	void breadthFirst(const Node<BaseType> *current);
	void addAux(Node<BaseType> *current, Node<BaseType> *target);
	bool removeAux(Node<BaseType> *parent, Node<BaseType> *current, const BaseType &val);
public:
	BSTree();
	virtual ~BSTree();
	//bool friend operator>(const Node<BaseType> lhs, const Node<BaseType> rhs) { return lhs > rhs; }
	//bool friend operator==(const Node<BaseType> lhs, const Node<BaseType> rhs) { return lhs == rhs; }
	void add(const BaseType &val);
	void print(short int order=0);

	// Search: return node
	bool remove(const BaseType &val);// Remove: can't use search, need parent node to delete middle nodes; have to reimplement search
	// Breadth First Traversal
	// Depth First Traversal
	// pretty print: need formula
};

#include "BSTree.t"

#endif
