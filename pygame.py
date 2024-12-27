import pygame
import sys
import numpy as np

# 初始化pygame
pygame.init()

# 设置屏幕大小
WINDOW_WIDTH, WINDOW_HEIGHT = 2060, 1040
screen = pygame.display.set_mode((WINDOW_WIDTH, WINDOW_HEIGHT))
pygame.display.set_caption('Subplot Mosaic with Grid on All')

# 定义颜色
WHITE = (255, 255, 255)
BLACK = (0, 0, 0)

# 定义子图区域的边界
axes = {}
axes['A'] = pygame.Rect(20, 20, 1000, 1000)
axes['B'] = pygame.Rect(1040, 20, 495, 495)
axes['C'] = pygame.Rect(1545, 20, 495, 495)
axes['D'] = pygame.Rect(1040, 525, 495, 495)
axes['E'] = pygame.Rect(1545, 525, 495, 495)

# 根据 NumPy 矩阵创建 Pygame surface
def create_surface_from_matrix(matrix):
    # 检查矩阵是否为二维的
    if len(matrix.shape) != 2:
        raise ValueError("Only 2D matrices are supported.")

    # 创建新的surface
    surface = pygame.Surface(matrix.shape[::-1])

    # 遍历矩阵元素并设置像素
    for y in range(matrix.shape[0]):
        for x in range(matrix.shape[1]):
            grayscale = matrix[y][x]
            color = (grayscale, grayscale, grayscale)
            surface.set_at((x, y), color)

    return surface

def draw_grid_on_subplot(subplot_rect):
    # 计算栅格的行数和列数
    # cols = subplot_rect.width // grid_size
    # rows = subplot_rect.height // grid_size
    
    # 创建一个随机的NumPy矩阵
    matrix = np.random.randint(0, 256, (10, 10))
    
    # 根据矩阵生成栅格surface
    matrix_surface = create_surface_from_matrix(matrix)
    
    # 缩放栅格Surface以适应子图的大小
    scaled_matrix_surface = pygame.transform.scale(matrix_surface, (subplot_rect.width, subplot_rect.height))
    
    # 将缩放后的栅格Surface绘制到子图的位置
    screen.blit(scaled_matrix_surface, subplot_rect.topleft)

# 游戏循环标志
running = True

# 游戏主循环
while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False
    
    # 填充背景
    screen.fill(WHITE)

    # 在所有子图上绘制栅格
    for key, rect in axes.items():
        draw_grid_on_subplot(rect)

    # 绘制每个子图的边框
    for key, rect in axes.items():
        pygame.draw.rect(screen, BLACK, rect, 1)

    # 更新屏幕显示
    pygame.display.flip()
    pygame.time.wait(10000)

# 退出pygame
pygame.quit()
sys.exit()
