#include <stdio.h>
#include <stdlib.h>

int *twoSum(int *nums, int numsSize, int target);

int main(void) {
    int nums[] = {2, 7, 11, 15};
    int target = 9;
    int n = (int)(sizeof nums / sizeof nums[0]);

    int *ans = twoSum(nums, n, target);
    if (ans == NULL) {
        fprintf(stderr, "no solution\n");
        return 1;
    }
    printf("%d %d\n", ans[0], ans[1]);
    free(ans);
    return 0;
}
