/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   header_test.h                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vscabell <vscabell@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/09/21 22:04:20 by vscabell          #+#    #+#             */
/*   Updated: 2020/09/26 18:23:37 by vscabell         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef HEADER_TEST_H
# define HEADER_TEST_H

# include <stdlib.h>
# include <string.h>
# include <stdio.h>
# include <unistd.h>
# include <errno.h>
# include <fcntl.h>

# define STD 0
# define FD_OPEN 1
# define FD_WRONG 2
# define ORIG 0
# define IMPLEM 1

size_t				ft_strlen(const char *s);
char				*ft_strcpy(char *dest, const char *src);
int					ft_strcmp(const char *s1, const char *s2);
ssize_t				ft_write(int fd, const void *buf, size_t count);
ssize_t				ft_read(int fd, void *buf, size_t count);
char				*ft_strdup(const char *s);

typedef struct		s_list
{
	void			*data;
	struct s_list	*next;
}					t_list;

int					ft_atoi_base(char *str, char *base);
void				ft_list_push_front(t_list **begin_list, void *data);
int					ft_list_size(t_list *begin_list);
void				ft_list_sort(t_list **begin_list, int (*cmp)());
void				ft_list_remove_if(t_list **begin_list, void *data_ref,
	int (*cmp)(), void (*free_fct)(void *));

/*
** auxiliar functions
*/

void				list_push_front(t_list **begin_list, void *data);
void				initialize_list(t_list **list, int index, void (*ft)());
void				ft_print_list(t_list *list);
void				ft_free(void *ptr);
void				ft_list_clear(t_list *begin_list, void (*free_fct)(void *));

#endif
