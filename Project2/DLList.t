#include <iostream>

using namespace std;

// Constructor
template <class BaseType>
DLList<BaseType>::DLList()
{
	this->root = new LLNode<BaseType>;
}


// Destructor
template <class BaseType>
DLList<BaseType>::~DLList()
{
}


// Insert
template <class BaseType>
bool DLList<BaseType>::insert(const BaseType &val)
{
	LLNode<BaseType> *iterator = root;

	while (iterator->next != nullptr)
	{
		iterator = iterator->next;  // First iteration is always passed, root is always dummy

		if (iterator->val == val)
		{
			(iterator->frequency)++;
			return true;
		}
	}

	try
	{
		iterator->next = new LLNode<BaseType>(val, 1);
		return true;
	}
	catch (exception const &ex)
	{
		cerr << "[List Insertion] Exception: " << ex.what() << endl;
	}


	return false;
}


// Remove Node from list
template <class BaseType>
bool DLList<BaseType>::remove(const BaseType &val)
{
	// you are here...
}

// Print List
template <class BaseType>
void DLList<BaseType>::print()
{
	if (root->next == nullptr) { return; }  // List is empty

	LLNode<BaseType> *iterator = root;

	while (iterator->next)
	{
		iterator = iterator->next;
		cout << " | " << iterator->val << ": " << iterator->frequency << " | " ;
	}
}