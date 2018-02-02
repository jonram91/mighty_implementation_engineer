def remove_non_nums(string_of_nums):

    """
    This helper function looks at every character in a string of numbers and returns a string of only numeric characters.

    e.g. remove_non_nums('01-2-3') would return '0123'
    """

    output = ''

    for char in string_of_nums:

        if char in '0123456789':

            output += char

    return output
	
	
def ss_format(final_num_str):

	"""
	This function takes a final cleaned and padded numerical 
	string and returns it in the format '123-45-6789.'
	"""

	return final_num_str[:3] + '-' + final_num_str[3:5] + '-' + final_num_str [5:]

	
def ss_cleaner(social_sec):

	"""
	This function takes a string and converts it to
	the format 123-45-6789 outputing it as a string.
	-----------------------------------------------
	INPUT: social_sec (string)
	OUTPUT: Reformatted social_sec in format "123-45-6789"

	Special cases:

	1) Fewer than 9 digits - Pad with 0s on front
	2) More than 9 digits - Take only first 9
	3) Empty string - Return empty string

	"""

	#Ensuring that input is a string

	assert isinstance(social_sec, str), "Input must be a string!"

	#Empty strings input will return empty strings

	if social_sec == "":

			return social_sec

	#Calling the helper function to remove any non-numerical chars

	numerical_chars = remove_non_nums(social_sec)

	#Anything longer than 9 chars is truncated.

	if len(numerical_chars) >= 9:

			return ss_format(numerical_chars[:9]) 

	#Anything less than 9 characters is padded with 0s

	elif len(numerical_chars) < 9:

			numerical_chars = '0'*(9-len(numerical_chars)) + numerical_chars

			return ss_format(numerical_chars)