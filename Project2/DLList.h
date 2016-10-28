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

	LLNode<BaseType> &operator=(const LLNode<BaseType> &rhs)
	{
		val = rhs.val;
		frequency = rhs.frequency;
		//prev = rhs.prev;
		//next = rhs.next;
		return *this;
	}

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
	int size;
	void swap(LLNode<BaseType> *lhs, LLNode<BaseType> *rhs); // Make private once completed
public:
	DLList();
	virtual ~DLList();
	bool insert(const BaseType &val);
	bool remove(const BaseType &val);
	void print();
	void quicksort(); // sort by freq in descending for huffman coding algorithm
	//void SortByFrequency();
	//void SortByValue();

	
};

#include "DLList.t"

#endif