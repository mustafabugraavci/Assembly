#include "../include/main.h"
#include "unity/src/unity.h"

void setUp(void)
{

}

void tearDown(void)
{

}

void test_addition(void)
{
    TEST_ASSERT_EQUAL(5, add(2,3));
}

void test_addition_failure(void)
{
    TEST_ASSERT_EQUAL(7, add(2,3));
}

