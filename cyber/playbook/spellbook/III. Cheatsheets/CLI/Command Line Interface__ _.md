# Command Line Interface

## awk
    
- ### Built in variables

  `$0`: entire line
  
  `$n`: field n of line (i.e. $1, $2, $3, and so on    
    
  `NR`: NR command keeps a current count of the number  of input records. Remember that records are usually lines. Awk command  performs the pattern/action statements once for each record in a file.

  `NF`: NF command keeps a count of the number of fields within the current input record.
    
  `FS`: FS command contains the field separator  character which is used to divide fields on the input line. The default  is “white space”, meaning space and tab characters.  FS can be  reassigned to another character (typically in BEGIN) to change the field separator.

  `RS`: RS command stores the current record separator  character. Since, by default, an input line is the input record, the default record separator character is a newline. 

  `OFS`: OFS command stores the output field separator,  which separates the fields when Awk prints them. The default is a blank  space. Whenever print has several parameters separated with commas, it will print the value of OFS in between each parameter.

  `ORS`: ORS command stores the output record separator,  which separates the output lines when Awk prints them. The default is a newline character. Print automatically outputs the contents of ORS at the end of whatever it is given to print.

- ### Print every line of a file
  
	  awk '{print}' <file_name>
    
- ### Print the lines which matches with the given pattern.

  `awk '/<pattern>/ {print}' <file_name>`
    
- ### Print selected fields of a file
  
  `awk '{print $<field>, $<field>}' <file_name>`
    
- ### Print lines where the selected field matches the specified string
  
  `awk '{ if($<field> == "<string>") print $0;}' <file_name>`

- ### Sum all numbers in a field of a text file
  
  `awk '{s+=$<field>} END {print s}' <file_name>`

- ### Sum values of a field based on values of another field

  `awk '{a[$<index_field>] += <sum_field>} END{for (i in a) print i, a[i]}' <file_name>`

- ### Cut wordlist to words of length 8 to 64 characters

  `awk '{ if ((length($0) > 7) && (length($0) < 64)){ print $0 }}' <file_name>`


- ### Sort wordlist by length
  `awk '{print length, $0}' old.txt | sort -n | cut -d " " -f2- > new.txt`

## cut

- ### cut field/remove text based on a specific delimeter
  
  `cut -f2 -d"<character>" <file_name>`
  
## sed

[Handy one liners for sed](https://edoras.sdsu.edu/doc/sed-oneliners.html)

    
- ### Eliminate trailing spaces

  `sed -i ‘s/[[:space:]]*$//’ <file_name>`

## tail

- ### watch changes to file in real time
  `tail -f <file_name>`

## tr

- ### Remove newlines from a file
  `tr -d '\n' < <file_name>`
    
- ### Change uppercase characters to lower
  `cat <file_name> | tr ‘[:upper:]’ ‘[:lower:]’`

## history

- ### reverse history search
  `ctrl+r`
    