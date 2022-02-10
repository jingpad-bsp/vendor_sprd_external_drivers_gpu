
#ifndef _GRALLOC_PUBLIC_
#define _GRALLOC_PUBLIC_
#define PARAM_IGNORE(x) (void)x

/*gpu version*/
#define	rogue   0x01
#define	midgard 0x02
#define	soft    0x04
#define	utgard  0x08
#define gondul  0x10

#define SPRD_GPU_PLATFORM_ROGUE (TARGET_GPU_PLATFORM & rogue)
#define SPRD_GPU_PLATFORM_MIDGARD (TARGET_GPU_PLATFORM & midgard)
#define SPRD_GPU_PLATFORM_SOFT (TARGET_GPU_PLATFORM & soft)
#define SPRD_GPU_PLATFORM_UTGARD (TARGET_GPU_PLATFORM & utgard)
#define SPRD_GPU_PLATFORM_GONDUL (TARGET_GPU_PLATFORM & gondul)


#if SPRD_GPU_PLATFORM_ROGUE

#define PVR_ANDROID_HAS_SET_BUFFERS_DATASPACE
#define PVR_ANDROID_HAS_SET_BUFFERS_DATASPACE_2

#include "rogue/img_gralloc_public.h"
#define NUM_FB_BUFFERS 3

typedef enum
{
	USC_YUV_NO_INFO       = IMG_COLORSPACE_UNDEFINED,
	USC_YUV_BT601_NARROW  = IMG_COLORSPACE_BT601_CONFORMANT_RANGE,
	USC_YUV_BT601_WIDE    = IMG_COLORSPACE_BT601_FULL_RANGE,
	USC_YUV_BT709_NARROW  = IMG_COLORSPACE_BT709_CONFORMANT_RANGE,
	USC_YUV_BT709_WIDE    = IMG_COLORSPACE_BT709_FULL_RANGE,
	USC_YUV_BT2020_NARROW = IMG_COLORSPACE_BT2020_CONFORMANT_RANGE,
	USC_YUV_BT2020_WIDE   = IMG_COLORSPACE_BT2020_FULL_RANGE,
	USC_YUV_BT601_NARROW_INVERSE  =	IMG_COLORSPACE_BT601_CONFORMANT_RANGE_INVERSE,
	USC_YUV_BT601_WIDE_INVERSE    =	IMG_COLORSPACE_BT601_FULL_RANGE_INVERSE,
	USC_YUV_BT709_NARROW_INVERSE  =	IMG_COLORSPACE_BT709_CONFORMANT_RANGE_INVERSE,
	USC_YUV_BT709_WIDE_INVERSE    =	IMG_COLORSPACE_BT709_FULL_RANGE_INVERSE,
	USC_YUV_BT2020_NARROW_INVERSE =	IMG_COLORSPACE_BT2020_CONFORMANT_RANGE_INVERSE,
	USC_YUV_BT2020_WIDE_INVERSE   =	IMG_COLORSPACE_BT2020_FULL_RANGE_INVERSE
} USC_YUV_INFO;

static inline int ADP_FORMAT(buffer_handle_t h)
{
	if (h == NULL)
		return 0;

	return SprdHALPixelFormatGetRawFormat(((IMG_native_handle_t*)h)->iFormat);
}

static inline int ADP_WIDTH(buffer_handle_t h)
{
	if (h == NULL)
		return 0;

	return ((IMG_native_handle_t*)h)->iWidth;
}

static inline int ADP_HEIGHT(buffer_handle_t h)
{
	if (h == NULL)
		return 0;

	return ((IMG_native_handle_t*)h)->iHeight;
}

static inline int ADP_STRIDE(buffer_handle_t h)
{
	if (h == NULL)
		return 0;

	return ((IMG_native_handle_t*)h)->aiStride[0];
}

static inline int ADP_VSTRIDE(buffer_handle_t h)
{
	if (h == NULL)
		return 0;

	return ((IMG_native_handle_t*)h)->aiVStride[0];
}

static inline int ADP_BUFFD(buffer_handle_t h)
{
	if (h == NULL)
		return 0;

	return ((IMG_native_handle_t*)h)->fd[0];
}

static inline int ADP_YINFO(buffer_handle_t h)
{
	if (h == NULL)
		return 0;

	return ((IMG_native_handle_t*)h)->yuv_info;

}


static inline int ADP_USAGE(buffer_handle_t h)
{
	if (h == NULL)
		return 0;

	return ((IMG_native_handle_t*)h)->usage;
}

static inline void* ADP_BASE(buffer_handle_t h)
{
	if (h == NULL)
		return 0;

	if (((IMG_native_handle_t*)h)->vCpuVirtAddr)
		return ((IMG_native_handle_t*)h)->vCpuVirtAddr[0];

	return 0;
}

static inline int ADP_BUFSIZE(buffer_handle_t h)
{
	if (h == NULL)
		return 0;

	if (((IMG_native_handle_t*)h)->sSize)
		return ((IMG_native_handle_t*)h)->sSize[0];

	return 0;
}

static inline int ADP_FAKESETBUFATTR_CAMERAONLY(buffer_handle_t h, int size, int width, int height)
{
	if ((h == NULL) || (size <= 0) || (width <= 0) || (height <= 0))
		return 0;

	if (((IMG_native_handle_t*)h)->sSize)
	{
		((IMG_native_handle_t*)h)->sSize[0] = size;
		((IMG_native_handle_t*)h)->iWidth = width;
		((IMG_native_handle_t*)h)->iHeight = height;
		return ((IMG_native_handle_t*)h)->sSize[0];
	}

	return 0;
}

static inline int ADP_COMPRESSED(buffer_handle_t h)
{
	if (h == NULL)
		return HAL_FB_COMPRESSION_NONE;

	if (!SprdIsVendorFormat(((IMG_native_handle_t*)h)->iFormat)) {
		return HAL_FB_COMPRESSION_NONE;
	} else {
		return (((((IMG_native_handle_t*)h)->iFormat >> 12) & 0x7) ==
			HAL_FB_COMPRESSION_DIRECT_8x8);
	}
}

static inline int ADP_HEADERSIZER(buffer_handle_t h)
{
	if (h == NULL)
		return 0;

	return (((IMG_native_handle_t*)h)->uiHeaderR);
}

static inline int ADP_HEADERSIZEY(buffer_handle_t h)
{
	return 0;
}

static inline int ADP_HEADERSIZEUV(buffer_handle_t h)
{
	return 0;
}

#else

#if SPRD_GPU_PLATFORM_MIDGARD
#include "midgard/include/gralloc_priv.h"
#elif SPRD_GPU_PLATFORM_SOFT
#include "soft/include/gralloc_priv.h"
#elif SPRD_GPU_PLATFORM_UTGARD
#include "utgard/include/gralloc_priv.h"
#elif SPRD_GPU_PLATFORM_GONDUL
#include "gondul/include/gralloc_priv.h"
#endif

typedef enum
{
	USC_YUV_NO_INFO       = MALI_YUV_NO_INFO,
	USC_YUV_BT601_NARROW  = MALI_YUV_BT601_NARROW,
	USC_YUV_BT601_WIDE    = MALI_YUV_BT601_WIDE,
	USC_YUV_BT709_NARROW  = MALI_YUV_BT709_NARROW,
	USC_YUV_BT709_WIDE    = MALI_YUV_BT709_WIDE,
	USC_YUV_BT2020_NARROW = MALI_YUV_BT2020_NARROW,
	USC_YUV_BT2020_WIDE   = MALI_YUV_BT2020_WIDE,
	USC_YUV_BT601_NARROW_INVERSE  =	MALI_YUV_NO_INFO,/*reserved*/
	USC_YUV_BT601_WIDE_INVERSE    =	MALI_YUV_NO_INFO,/*reserved*/
	USC_YUV_BT709_NARROW_INVERSE  =	MALI_YUV_NO_INFO,/*reserved*/
	USC_YUV_BT709_WIDE_INVERSE    =	MALI_YUV_NO_INFO,/*reserved*/
	USC_YUV_BT2020_NARROW_INVERSE =	MALI_YUV_NO_INFO,/*reserved*/
	USC_YUV_BT2020_WIDE_INVERSE   =	MALI_YUV_NO_INFO /*reserved*/
} USC_YUV_INFO;


static inline int ADP_FORMAT(buffer_handle_t h)
{
	if (h == NULL)
		return 0;

	return ((private_handle_t*)h)->format;
}

static inline int ADP_WIDTH(buffer_handle_t h)
{
	if (h == NULL)
		return 0;

	return ((private_handle_t*)h)->width;
}

static inline int ADP_HEIGHT(buffer_handle_t h)
{
	if (h == NULL)
		return 0;

	return ((private_handle_t*)h)->height;
}

static inline int ADP_STRIDE(buffer_handle_t h)
{
	if (h == NULL)
		return 0;

	return ((private_handle_t*)h)->stride;
}

static inline int ADP_VSTRIDE(buffer_handle_t h)
{
	if (h == NULL)
		return 0;

	return ((private_handle_t*)h)->vstride;

}


static inline int ADP_BUFFD(buffer_handle_t h)
{
	if (h == NULL)
		return 0;

	return ((private_handle_t*)h)->share_fd;
}

static inline int ADP_YINFO(buffer_handle_t h)
{
	if (h == NULL)
		return 0;

	return ((private_handle_t*)h)->yuv_info;
}

static inline int ADP_USAGE(buffer_handle_t h)
{
	if (h == NULL)
		return 0;

	return ((private_handle_t*)h)->usage;
}

static inline int ADP_FLAGS(buffer_handle_t h)
{
	if (h == NULL)
		return 0;

	return ((private_handle_t*)h)->flags;
}

/*this interface only for sf process */
static inline void* ADP_BASE(buffer_handle_t h)
{
	if (h == NULL)
		return 0;

	return ((private_handle_t*)h)->base;
}

static inline int ADP_BUFSIZE(buffer_handle_t h)
{
	if (h == NULL)
		return 0;

	return ((private_handle_t*)h)->size;
}

static inline int ADP_FAKESETBUFATTR_CAMERAONLY(buffer_handle_t h, int size, int width, int height)
{
	if ((h == NULL) || (size <= 0) || (width <= 0) || (height <= 0))
		return 0;

	((private_handle_t*)h)->size = size;
	((private_handle_t*)h)->width = width;
	((private_handle_t*)h)->height = height;
	return ((private_handle_t*)h)->size;
}

static inline int ADP_COMPRESSED(buffer_handle_t h)
{
	if (h == NULL)
		return 0;

	if(((private_handle_t*)h)->internal_format & MALI_GRALLOC_INTFMT_AFBCENABLE_MASK)
	{
		return 1;
	}else
	{
		return 0;
	}
}

static inline int ADP_HEADERSIZER(buffer_handle_t h)
{
#if SPRD_GPU_PLATFORM_GONDUL
	if(NULL == h)
	return 0;

	return ((private_handle_t*)h)->HeaderSize;
#else
	return 0;
#endif
}

static inline int ADP_HEADERSIZEY(buffer_handle_t h)
{
	return 0;
}

static inline int ADP_HEADERSIZEUV(buffer_handle_t h)
{
	return 0;
}
#define ADP_BUFINDEX(h)	((private_handle_t*)h)->buf_idx
#endif

#endif

