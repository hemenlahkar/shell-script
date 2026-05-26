#!/bash/sh
# Check whether the number is Armstrong or not

printf "Enter the number: "
read n

if [ $n -lt 0 ]; then
	echo "Invalid input: number must be positive!"
	exit 1
fi

dsum=0
temp=$n
until [ $temp -eq 0 ]; do
	digit=$(( temp % 10 ))
	dsum=$(( dsum + digit * digit * digit ))
	temp=$(( temp / 10 ))
done

if [ $dsum -eq $n ]; then
	echo "$n is an Armstrong number."
else
	echo "$n is NOT an Armstrong number!"
fi
