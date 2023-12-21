#include <iostream>
#include <windows.h>

extern "C"
{
	int __stdcall lenght(char* str)					// вычисление длины строки
	{
		if (str == nullptr)
			return 0;
		int len = 0;
		for (int i = 0; i < 256; i++)
			if (str[i] == '\0')
			{
				len = i; break;
			}
		return len;
	}


	int __stdcall atoii(char* buffer, char* ptr)					// преобразование символьного литерала
	{
		int n = 0;
		while (*ptr >= '0' && *ptr <= '9')
		{
			n *= 10;
			n += *ptr++;
			n -= '0';
		}
		return n;
	}


	char* __stdcall strcopy(char* buffer, char* str)				// копирование строк
	{
		int i = NULL, len1 = NULL, len2 = NULL;
		for (int j = 0; str[j] != '\0'; j++)
		{
			if (i == 255)
				break;
			buffer[i++] = str[j];
		}
		buffer[i] = '\0';
		return buffer;
	}


	int __stdcall outnum(int value)									// вывод в консоль целочисленного литерала
	{
		std::cout << value;
		return 0;
	}

	int __stdcall strcomp(char* str1, char* str2) // сравнивает две строки
	{
		int i = NULL, len1 = NULL, len2 = NULL;
		for (; str1[len1] != '\0'; len1++);
		for (; str2[len2] != '\0'; len2++);
		int length = len1 > len2 ? len2 : len1;
		for (int k = 0; i < length; k++, i++)
		{
			if (str1[k] != str2[i])
			{
				if (str1[k] > str2[i])
					return 1;
				else if (str1[k] < str2[i])
					return -1;
			}
		}
		if (len1 != len2)
			return len1 > len2 ? 1 : -1;
		return 0;
	}

	int __stdcall outstr(char* ptr)									// вывод в консоль строкового литерала
	{
		setlocale(0, "");
		SetConsoleCP(1251);
		SetConsoleOutputCP(1251);
		if (ptr == nullptr)
			std::cout << std::endl;
		for (int i = 0; ptr[i] != '\0'; i++)
			std::cout << ptr[i];
		return 0;
	}
}