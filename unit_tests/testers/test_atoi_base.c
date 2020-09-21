/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_atoi_base.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vscabell <vscabell@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/09/21 01:58:04 by vscabell          #+#    #+#             */
/*   Updated: 2020/09/21 22:07:49 by vscabell         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "header_test.h"

void	print_ft_atoi_base(char *str, char *base)
{
	printf("%i\n", ft_atoi_base(str, base));
}

int		main(int argc, char **argv)
{
	int		index;

	index = atoi(argv[1]);

	if (index == 1)
		print_ft_atoi_base(" +--56", "0123456789");
	else if (index == 2)
		print_ft_atoi_base("	---ff", "0123456789abcdef");
	else if (index == 3)
		print_ft_atoi_base("\v-42", "0123456789");
	else if (index == 4)
		print_ft_atoi_base("\f+-+-11101", "01");
	else if (index == 5)
		print_ft_atoi_base("  -+00501", "0123456789");
	else if (index == 6)
		print_ft_atoi_base(" +105", "0123456789");
	else if (index == 7)
		print_ft_atoi_base("  -+11", "01");
	else if (index == 8)
		print_ft_atoi_base("15256", "");
	else if (index == 9)
		print_ft_atoi_base("15", "5");
	else if (index == 10)
		print_ft_atoi_base("122", "-123456789");
	else if (index == 11)
		print_ft_atoi_base("122", "012+3456789");
	else if (index == 12)
		print_ft_atoi_base("111", "0 1");
	else if (index == 13)
		print_ft_atoi_base("568", "012345\t6789");
	else if (index == 14)
		print_ft_atoi_base("111", "01\r");
	else if (index == 15)
		print_ft_atoi_base("155", "01234506789");
	else if (index == 16)
		print_ft_atoi_base("05", "012345067890");
	else if (index == 17)
		print_ft_atoi_base("abc56", "0123456789");
	else if (index == 18)
		print_ft_atoi_base(NULL, "0123456789");
	else if (index == 19)
		print_ft_atoi_base("501", NULL);
	return (0);
}
