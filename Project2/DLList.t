/******************************************************
*
*  Created: 27 Oct 2016_WB.Metzel
*  Last Revised: 28 Oct 2016
*
*  Future: - Add node to always point at end to insert,remove,search from both ends at once
*          - multithreaded
*******************************************************/

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
		//LLNode<BaseType> *temp = 
		iterator->next = new LLNode<BaseType>(val, 1);
		(iterator->next)->prev = iterator;
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
	if (root->next == nullptr) { return false; }  // List is empty

	LLNode<BaseType> *iterator = root;

	while (iterator->next || iterator->prev)
	{
		if (iterator->val == val)
		{
			if (iterator->frequency > 1)
			{
				(iterator->frequency)--;
			}
			else
			{
				// Remove entire node
				if (iterator->next)
				{
					(iterator->prev)->next = iterator->next;

					if (iterator->prev)
					{
						(iterator->next)->prev = iterator->prev;
					}
					else
					{
						(iterator->prev)->next = nullptr;
					}
				}
				else
				{
					(iterator->prev)->next = nullptr;
				}

				delete iterator;

			}
			return true;
		}
		iterator = iterator->next;
	}

	return false; // Nothing was removed
}

// Print List
template <class BaseType>
void DLList<BaseType>::print()
{
	if (root->next == nullptr) { return; }  // List is empty

	LLNode<BaseType> *iterator = root;

	while (iterator = iterator->next)
	{
		cout << " | " << iterator->val << ": " << iterator->frequency << " | " ;
	}

}