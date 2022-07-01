echo "***************************************************************************************"
echo "Welcome to Dynamodb Data Batch Importer"
echo "It will import your Dynamodb data to aws using aws cli batch-write-item"
echo "Before we started, please check your aws configure"
echo "Enter the exported table name"
read -e folder_path
echo "finding import script at " $folder_path/ScriptForDataImport

start_time="$(date -u +%s)"

echo "Enter the AWS region: "
read -e aws_region_name

echo "Enter the AWS profile: "
read -e aws_profile

#import all data in the folder
for filename in $folder_path/ScriptForDataImport/*.txt; do
    echo "importing ${filename}"
    aws dynamodb batch-write-item --region $aws_region_name --request-items file://${filename} --profile $aws_profile
done


echo "Completed"
echo "***************************************************************************************"
end_func_time="$(date -u +%s)"
echo "Total of $(($end_func_time-$start_time)) seconds to completed the function"
