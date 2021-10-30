/* basic

#include <iostream>
using namespace std;

int main()
{
    int n;
    cin>>n;

    for(int i=1;i<=n;i++)
    {
        if(i==5)
        continue;

        if(i==7)
        break;

        cout<<i;
    }

    return 0;
}

*/



/*Print number from 1 to 100 except number divisible by 3

#include <iostream>
using namespace std;

int main()
{
    for(int i=1;i<=100;i++)
    {
        if(i%3==0)
        continue;

        else
        cout<<i<<endl;;
    }
}

*/


/*prime number

#include <iostream>
using namespace std;

int main()
{
    int n,j=0;
    cin>>n;

    for(int i=2;i<=n/2;i++)
    {
        if(n%i==0)
        {
            cout<<"number is not prime";
            j=j+1;
            break;
        }    
    }
    if(j==0)
    cout<<"its a primme number";

    return 0;
}

*/


/* Prime numbers between a and b

#include <iostream>
using namespace std;

int main()
{
    int a,b,j=0;
    cin>>a>>b;

    for(int m=a;m<=b;m++)
    {
        j=0;
        for(int i=2;i<=m/2;i++)
    {
        if(m%i==0)
        {
            j=j+1;
        }    
    }
        if(j==0)
        {
            cout<<m<<endl;
        }

    }

    
   

    return 0;
}

*/ 


