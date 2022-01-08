import type { Recipe, RecipeHeader } from '$lib/types';

import { DynamoDBClient, ItemCollectionMetrics } from '@aws-sdk/client-dynamodb'
import { DynamoDBDocumentClient, QueryCommand } from '@aws-sdk/lib-dynamodb'

const client = DynamoDBDocumentClient.from(new DynamoDBClient({ region: 'us-east-2' }))

export async function listRecipes(): Promise<RecipeHeader[]> {
    const input = {
        TableName: 'Recipes',
        IndexName: 'GSI1',
        KeyConditionExpression: 'GSI1PK = :pk',
        ExpressionAttributeValues: { ':pk': 'recipe' },
        ExpressionAttributeNames: { '#Name': 'Name' },
        ProjectionExpression: "GSI1SK, #Name"
    };

    const response = await client.send(new QueryCommand(input))

    const toRecipeHeader = (item) => ({
        id: item.GSI1SK,
        name: item.Name
    })

    return response.Items.map(toRecipeHeader)
}


export async function getRecipe(id: string): Promise<Recipe> {
    const input = {
        TableName: 'Recipes',
        KeyConditionExpression: 'PK = :pk',
        ExpressionAttributeValues: { ':pk': id },
        ExpressionAttributeNames: { '#Name': 'Name', '#Type': 'Type' },
        ProjectionExpression: "Description, #Name, #Type, PK"
    };

    const response = await client.send(new QueryCommand(input))

    const toRecipe = (recipe: Recipe, item): Recipe => {
        if (item.Type === 'recipe') {
            recipe.id = item.PK
            recipe.name = item.Name
        }

        if (item.Type === 'ingredient') {
            recipe.ingredients.push(item.Description)
        }
        return recipe
    }

    const recipe: Recipe = { id: "", name: "", ingredients: [] }
    response.Items.reduce(toRecipe, recipe)
    return recipe;
}
