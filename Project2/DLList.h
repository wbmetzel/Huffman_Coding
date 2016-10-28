/**************************************
*
* A Doubly Linked List to get frequency
*  of chars in text file.
*
***************************************/

#ifndef _DLLIST__
#define _DLLIST__

template <class BaseType>
struct LLNode {
	BaseType val;
	int frequency;
	LLNode *prev, *next;

	// Constructor
	LLNode()
	{
		this->val = NULL;
		this->frequency = 0;
		this->next = nullptr;
		this->prev = nullptr;
	}

	// Copy Constructor
	LLNode(const BaseType &val, const int &freq=1)
	{
		this->val = val;
		this->frequency = freq;
		this->prev = nullptr;
		this->next = nullptr;
	}

};


template <class BaseType>
class DLList
{
private:
	LLNode<BaseType> *root;
public:
	DLList();
	virtual ~DLList();
	bool insert(const BaseType &val);
	bool remove(const BaseType &val);
	void print();
	//void SortByFrequency();
	//void SortByValue();
};

#include "DLList.t"

#endif