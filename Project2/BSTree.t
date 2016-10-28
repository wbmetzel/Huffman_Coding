
#include <iostream>

using namespace std;


template <class BaseType>
BSTree<BaseType>::BSTree()
{
	this->root = new Node<BaseType>(NULL);
}

template <class BaseType>
BSTree<BaseType>::~BSTree()
{
}

// Add a node to the tree
template <class BaseType>
void BSTree<BaseType>::add(const BaseType &val)
{
	if (root->val == NULL)
	{
		root->val = val;
	}
	else
	{
		Node<BaseType> *target = new Node<BaseType>(val);
		this->addAux(root,target);
	}
}


// Auxiliary function for adding a node to the tree
template <class BaseType>
void BSTree<BaseType>::addAux(Node<BaseType> *current, Node<BaseType> *target)
{
	if (current->val > target->val)
	{
		if (current->left == nullptr)
		{
			
			current->left = target;
		}
		else
		{
			this->addAux(current->left,target);
		}
	}
	else if (target->val > current->val)
	{
		if (current->right == nullptr)
		{
			current->right = target;
		}
		else
		{
			this->addAux(current->right, target);
		}
	}
	else
	{
		cerr << "Add Failed: Duplicate found." << endl;
	}
}


// Print the tree (inorder traversal)
template <class BaseType>
void BSTree<BaseType>::print(short int order=0)
{
	if (root->val == NULL)
	{
		cout << "The tree is empty." << endl;
	}
	else
	{
		switch (order)
		{
		case 1:
			this->inorder(root);
			break;
		case 2:
			this->preorder(root);
			break;
		case 3:
			this->postorder(root);
			break;
		default:
			this->breadthFirst(root);
		}
		cout << endl;
	}
}


// Print Inorder
template <class BaseType>
void BSTree<BaseType>::inorder(const Node<BaseType> *current)
{
	if (current == nullptr) return;
	inorder(current->left);
	cout << current->val << " ";
	inorder(current->right);
}


// Print postorder
template <class BaseType>
void BSTree<BaseType>::postorder(const Node<BaseType> *current)
{
	if (current == nullptr) return;
	postorder(current->left);
	postorder(current->right);
	cout << current->val << " ";
}


// Print preorder
template <class BaseType>
void BSTree<BaseType>::preorder(const Node<BaseType> *current)
{
	if (current == nullptr) return;
	cout << current->val << " ";
	preorder(current->left);
	preorder(current->right);
}


// Print preorder
template <class BaseType>
void BSTree<BaseType>::breadthFirst(const Node<BaseType> *current)
{
	// todo
}


// Remove a node from a tree
template <class BaseType>
bool BSTree<BaseType>::remove(const BaseType &val)
{
	return this->removeAux(NULL,root,val);
}


// Auxiliary function for remove
// Case 1: Node being removed has no children
// Case 2: Node being removed has one child
// Case 3: Node being removed has two children
template <class BaseType>
bool BSTree<BaseType>::removeAux(Node<BaseType> *parent, Node<BaseType> *current, const BaseType &val)
{
	if (current == nullptr) { return false; }
	
	if (current->val == val)
	{
		if (current->left == nullptr && current->right == nullptr)  // Case 1
		{
			if (parent == NULL)
			{
				current->val = NULL;  // Don't delete root
				return true;
			}
			else
			{
				if (parent->left == current)
				{
					parent->left = nullptr;
				}
				else
				{
					parent->right = nullptr;
				}
				delete current;
				return true;
			}
			return false; // Never made it to either condition
		}
		else
		{
			Node<BaseType> *temp;  // Temporary pointer

			if (current->left != nullptr && current->right != nullptr)  // Case 3
			{
				temp = current->right;
				while(temp->left != nullptr)
				{
					temp = temp->left;
				}
				BaseType target = current->val;
				current->val = temp->val;
				temp->val = target;
				return removeAux(current, current->right,target);
			}
			else // Case 2
			{
				// Figure out which child current has
				if (current->left == nullptr)
				{
					temp = current->right;
				}
				else
				{
					temp = current->left;
				}

				// Figure out current's parent to will adopt
				if (parent == NULL)
				{
					this->root = temp;
				}
				else if (parent->left == current)
				{
					parent->left = temp;
				}
				else
				{
					parent->right = temp;
				}
				delete current;
				return true;
			}
		}
	}
	return removeAux(current, current->left, val) || removeAux(current, current->right, val);;
}