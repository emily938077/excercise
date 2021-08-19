// Dev-C++ 5.11
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
struct Node{
	int ID;
	struct Node *next;
};

struct list{
	int count;
	struct Node *head;
	struct Node *rear;
	struct Node *pos;
};

struct list list;
struct Node *head;
struct Node *pPre;
struct Node *pLoc;
struct Node *dataIn;
struct Node *pDataOut;
int count = 0; 
int ID;
bool found;
bool success;



struct list create()
{
 struct list createlist;
 createlist.head = NULL;
 createlist.rear = NULL;
 createlist.pos  = NULL;
 createlist.count = 0;
 return createlist;
}

char menu()
{
	char input;
	
	printf("\n***menu***\n A:add\n D:delete\n P:print\n Q:quit\n ENTER YOUR CHOICE:");
	
	scanf("%c",&input);
	if(input=='A')
	{
		getchar();		
		return 'A';		
	}
		
	else if(input=='P')
	{
		getchar();
		return 'P';			
	}
		
	else if(input=='D')
	{
		getchar();
		return 'D';			
	}
	else if(input=='Q')
	{
		getchar();
		return 'Q';			
	}
	else
	{
		getchar();
		printf("\nERROR. ENTER AGAIN\n");
		return 'R';
	}		
}

bool getNext(int fromWhere,int dataOut)
{
	if(fromWhere==0)
		{
		if(list.count==0)
			success=false;					
		else
			{
			list.pos=list.head;
			dataOut=list.pos->ID;
			success=true;
			}
		}
	else
		{
		if(list.pos->next==NULL)
			success=false;
		else
			{
			list.pos=list.pos->next;
			dataOut=list.pos->ID;
			success=true;	
			}	
		}		
	return success;
};

void printList()
{
	if(list.count==0)
	    printf("Sorry,nothing in the list\n");
	else
        {
        printf("\nprint the list: \n");
        list.pos = list.head;
        getNext(0,list.pos->ID);
        do
            {
             printf("%03d ",list.pos->ID);
              
            }while(getNext(1,list.pos->ID));
        printf("\nend of list\n");
        }
};

void deleteNode(int ID) 
{
 if (pPre== NULL) 
 {
  list.head = pLoc->next;
 }
 else 
 {
  pPre->next = pLoc->next;
 }
 list.count--;
 free( pLoc);
};

bool insertNode( int dataIn)
{
    struct Node *pNew = (struct Node*)malloc(sizeof(struct Node));
    pNew->ID = dataIn;
    pNew->next = NULL;
 if(pPre == NULL)
 {
    pNew->next = list.head;
    list.head = pNew;
 }
 else
 {
    pNew->next=pPre->next;
    pPre->next=pNew;
 }
 if(pNew->next==NULL)
 {
    list.rear = pNew;
 }
 list.count++;
 return true;
};

bool searchList(int ID) 
{
 	pPre = NULL;
 	pLoc = list.head;
 	if (list.count == 0) 
	{
   		return false;
 	}
 	else{
 		while((pLoc!= NULL)&&(ID>pLoc->ID))
		 {
		  	pPre = pLoc;
  	 		pLoc = pLoc->next;    
 		} 
 		if (pLoc==NULL) 
		 {
  			return false;
	 	 }
		else{
	 		if(ID == pLoc->ID)
			 {
	 			return true;
			 }
	 		else{
	 			return false;
			 }
	 }
 	}
	
};

void addNode(int ID)
{
	bool success;	
	found = searchList(ID);
 if(found == true)
 {
  	printf("Data already in link list.\n");
 }
 else{
  success = insertNode(ID);
  if(success == false)
  {
  	printf("Out of memory. Programming duitting\n");
  }
}
};

bool removeNode(int ID)
{
 found = searchList(ID);
 if(found)
 {
  	deleteNode(ID);
 }
 else
 {
 	printf("The data is not found in the list.");
 }
 return found;
};

void destroyList()
{
	struct Node* dltptr;
	while(list.head!=NULL)
	{
		dltptr = list.head;
		list.head = dltptr->next;
		--list.count;
	}
	list.pos = NULL;
};


int main(void)
{
 pPre=NULL;
 pLoc=NULL;
 list= create();
 char choice;
 choice = menu(); 
 char s[4];
 int i;
 while(choice!='Q')
 {
  if(choice=='A')
  { 
    do
	{
		printf("輸入學號後三碼: ");
		ID=NULL;
    	scanf("%s",&s);
    	for(i=0;i<=strlen(s);i++)
		{
    		if(isdigit(s[i]))
			{
    			ID=atoi(s);
    		}
		}
		if(ID<=999&&ID>=1)
    	{
    		addNode(ID);	
    	}
		else
    	{
    		printf("請輸入正確的學號後三碼 \n");
    		
		}
    
   }while(ID<0||ID>=999||ID==NULL);

   getchar();   
  }    
  else if(choice=='P')
  {
   printList();
   getchar();
  }  
  else if(choice=='D')
  {
   do
	{
		printf("輸入學號後三碼: ");
		ID=NULL;
    	scanf("%s",&s);
    	for(i=0;i<=strlen(s);i++)
		{
    		if(isdigit(s[i]))
			{
    			ID=atoi(s);
    		}
		}
		if(ID<=999&&ID>=1)
    	{
    		removeNode(ID);	
    	}
		else
    	{
    		printf("請輸入正確的學號後三碼 \n");
    		
		}
    
   }while(ID<0||ID>=999||ID==NULL);
   getchar(); 
  }
  else if(choice=='Q')
  {
   break;
  }  
  else if(choice =='R')
  {
   printf("");
  }
  choice=menu(); 
 }
	destroyList();
	printf("\nThe End.\n");
	printList();
	system("pause");	
	return 0;
}


