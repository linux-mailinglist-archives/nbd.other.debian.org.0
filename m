Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BCCA03958
	for <lists+nbd@lfdr.de>; Tue,  7 Jan 2025 09:09:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 09BE520701; Tue,  7 Jan 2025 08:09:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jan  7 08:09:10 2025
Old-Return-Path: <nilay@linux.ibm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	WORD_WITHOUT_VOWELS autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E3BCE206FC
	for <lists-other-nbd@bendel.debian.org>; Tue,  7 Jan 2025 07:51:39 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.769 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, UNWANTED_LANGUAGE_BODY=0.03,
	WORD_WITHOUT_VOWELS=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id IQankbJ4zE_P for <lists-other-nbd@bendel.debian.org>;
	Tue,  7 Jan 2025 07:51:33 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.pphosted.com", Issuer "Sectigo RSA Organization Validation Secure Server CA" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 83ED6206F5
	for <nbd@other.debian.org>; Tue,  7 Jan 2025 07:51:33 +0000 (UTC)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506NxSFx024534;
	Tue, 7 Jan 2025 07:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=a4nSA9
	/lNJ7YEp+Dsfs7cgFOX+E//pSKr0Tx1vCLJ/g=; b=FCgB9URoEbeWRd1aqr+5eO
	hlIc3sKtkBb0/2lovX7mxhentEiNtvF8WP2ovndzDXWqgYTzuBm6BDPF5Fbdxvg4
	q3jSHcj8YbsagEsSny5fy1L6Y3dmOL8eXhiL9bi32BzmDlR194FU8a0xlmusndCG
	FJI9pIUOpiWuAiIAPAJfdjqE87rI6DDb5uH2ZYG7mdopgTnnUS7ojJYNtY5tcych
	6HwkDhOqCZKiIsC3Kzd4Nmkyeqj8uizVr6EfktwulX1WDDHr2+FZCUj4Q3MEn1df
	pr5GFsubrVqCeKQCDyw7mN+j44LA30IDjytEdWWB065hL9ni5v7SnBDWj0HEZYvw
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 440sahhku1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 07:51:20 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50754wF3015805;
	Tue, 7 Jan 2025 07:51:19 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43ygtksbc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 07:51:19 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5077pIUo29557326
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Jan 2025 07:51:18 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 779EF58056;
	Tue,  7 Jan 2025 07:51:18 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7190F58052;
	Tue,  7 Jan 2025 07:51:15 +0000 (GMT)
Received: from [9.109.198.241] (unknown [9.109.198.241])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  7 Jan 2025 07:51:15 +0000 (GMT)
Message-ID: <ae6b7727-64d6-4d9e-9bf5-951e38d8a768@linux.ibm.com>
Date: Tue, 7 Jan 2025 13:21:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] block: add a store_limit operations for sysfs entries
To: Ming Lei <ming.lei@redhat.com>, Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Damien Le Moal <dlemoal@kernel.org>,
        linux-block@vger.kernel.org, linux-nvme@lists.infradead.org,
        nbd@other.debian.org, linux-scsi@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net
References: <20250107063120.1011593-1-hch@lst.de>
 <20250107063120.1011593-5-hch@lst.de> <Z3zXANbFk6GBZg_z@fedora>
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <Z3zXANbFk6GBZg_z@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: b86AiZTCrZgm7RWtYs4Ji68WHGqpZhiQ
X-Proofpoint-ORIG-GUID: b86AiZTCrZgm7RWtYs4Ji68WHGqpZhiQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501070061
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Ja-qk4-JjoD.A.l4LI.mEOfnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3248
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ae6b7727-64d6-4d9e-9bf5-951e38d8a768@linux.ibm.com
Resent-Date: Tue,  7 Jan 2025 08:09:11 +0000 (UTC)



On 1/7/25 12:55 PM, Ming Lei wrote:
> On Tue, Jan 07, 2025 at 07:30:36AM +0100, Christoph Hellwig wrote:
>> De-duplicate the code for updating queue limits by adding a store_limit
>> method that allows having common code handle the actual queue limits
>> update.
>>
>> Note that this is a pure refactoring patch and does not address the
>> existing freeze vs limits lock order problem in the refactored code,
>> which will be addressed next.
>>
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>> ---
>>  block/blk-sysfs.c | 128 ++++++++++++++++++++++------------------------
>>  1 file changed, 61 insertions(+), 67 deletions(-)
>>
>> diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
>> index 767598e719ab..8d69315e986d 100644
>> --- a/block/blk-sysfs.c
>> +++ b/block/blk-sysfs.c
>> @@ -24,6 +24,8 @@ struct queue_sysfs_entry {
>>  	struct attribute attr;
>>  	ssize_t (*show)(struct gendisk *disk, char *page);
>>  	ssize_t (*store)(struct gendisk *disk, const char *page, size_t count);
>> +	int (*store_limit)(struct gendisk *disk, const char *page,
>> +			size_t count, struct queue_limits *lim);
>>  	void (*load_module)(struct gendisk *disk, const char *page, size_t count);
>>  };
>>  
>> @@ -153,13 +155,11 @@ QUEUE_SYSFS_SHOW_CONST(discard_zeroes_data, 0)
>>  QUEUE_SYSFS_SHOW_CONST(write_same_max, 0)
>>  QUEUE_SYSFS_SHOW_CONST(poll_delay, -1)
>>  
>> -static ssize_t queue_max_discard_sectors_store(struct gendisk *disk,
>> -		const char *page, size_t count)
>> +static int queue_max_discard_sectors_store(struct gendisk *disk,
>> +		const char *page, size_t count, struct queue_limits *lim)
>>  {
>>  	unsigned long max_discard_bytes;
>> -	struct queue_limits lim;
>>  	ssize_t ret;
>> -	int err;
>>  
>>  	ret = queue_var_store(&max_discard_bytes, page, count);
>>  	if (ret < 0)
>> @@ -171,38 +171,28 @@ static ssize_t queue_max_discard_sectors_store(struct gendisk *disk,
>>  	if ((max_discard_bytes >> SECTOR_SHIFT) > UINT_MAX)
>>  		return -EINVAL;
>>  
>> -	lim = queue_limits_start_update(disk->queue);
>> -	lim.max_user_discard_sectors = max_discard_bytes >> SECTOR_SHIFT;
>> -	err = queue_limits_commit_update(disk->queue, &lim);
>> -	if (err)
>> -		return err;
>> -	return ret;
>> +	lim->max_user_discard_sectors = max_discard_bytes >> SECTOR_SHIFT;
>> +	return 0;
>>  }
>>  
>> -static ssize_t
>> -queue_max_sectors_store(struct gendisk *disk, const char *page, size_t count)
>> +static int
>> +queue_max_sectors_store(struct gendisk *disk, const char *page, size_t count,
>> +		struct queue_limits *lim)
>>  {
>>  	unsigned long max_sectors_kb;
>> -	struct queue_limits lim;
>>  	ssize_t ret;
>> -	int err;
>>  
>>  	ret = queue_var_store(&max_sectors_kb, page, count);
>>  	if (ret < 0)
>>  		return ret;
>>  
>> -	lim = queue_limits_start_update(disk->queue);
>> -	lim.max_user_sectors = max_sectors_kb << 1;
>> -	err = queue_limits_commit_update(disk->queue, &lim);
>> -	if (err)
>> -		return err;
>> -	return ret;
>> +	lim->max_user_sectors = max_sectors_kb << 1;
>> +	return 0;
>>  }
>>  
>>  static ssize_t queue_feature_store(struct gendisk *disk, const char *page,
>> -		size_t count, blk_features_t feature)
>> +		size_t count, struct queue_limits *lim, blk_features_t feature)
>>  {
>> -	struct queue_limits lim;
>>  	unsigned long val;
>>  	ssize_t ret;
>>  
>> @@ -210,15 +200,11 @@ static ssize_t queue_feature_store(struct gendisk *disk, const char *page,
>>  	if (ret < 0)
>>  		return ret;
>>  
>> -	lim = queue_limits_start_update(disk->queue);
>>  	if (val)
>> -		lim.features |= feature;
>> +		lim->features |= feature;
>>  	else
>> -		lim.features &= ~feature;
>> -	ret = queue_limits_commit_update(disk->queue, &lim);
>> -	if (ret)
>> -		return ret;
>> -	return count;
>> +		lim->features &= ~feature;
>> +	return 0;
>>  }
>>  
>>  #define QUEUE_SYSFS_FEATURE(_name, _feature)				\
>> @@ -227,10 +213,10 @@ static ssize_t queue_##_name##_show(struct gendisk *disk, char *page)	\
>>  	return sysfs_emit(page, "%u\n",					\
>>  		!!(disk->queue->limits.features & _feature));		\
>>  }									\
>> -static ssize_t queue_##_name##_store(struct gendisk *disk,		\
>> -		const char *page, size_t count)				\
>> +static int queue_##_name##_store(struct gendisk *disk,			\
>> +		const char *page, size_t count, struct queue_limits *lim) \
>>  {									\
>> -	return queue_feature_store(disk, page, count, _feature);	\
>> +	return queue_feature_store(disk, page, count, lim, _feature);	\
>>  }
>>  
>>  QUEUE_SYSFS_FEATURE(rotational, BLK_FEAT_ROTATIONAL)
>> @@ -266,10 +252,9 @@ static ssize_t queue_iostats_passthrough_show(struct gendisk *disk, char *page)
>>  	return queue_var_show(!!blk_queue_passthrough_stat(disk->queue), page);
>>  }
>>  
>> -static ssize_t queue_iostats_passthrough_store(struct gendisk *disk,
>> -					       const char *page, size_t count)
>> +static int queue_iostats_passthrough_store(struct gendisk *disk,
>> +		const char *page, size_t count, struct queue_limits *lim)
>>  {
>> -	struct queue_limits lim;
>>  	unsigned long ios;
>>  	ssize_t ret;
>>  
>> @@ -277,18 +262,13 @@ static ssize_t queue_iostats_passthrough_store(struct gendisk *disk,
>>  	if (ret < 0)
>>  		return ret;
>>  
>> -	lim = queue_limits_start_update(disk->queue);
>>  	if (ios)
>> -		lim.flags |= BLK_FLAG_IOSTATS_PASSTHROUGH;
>> +		lim->flags |= BLK_FLAG_IOSTATS_PASSTHROUGH;
>>  	else
>> -		lim.flags &= ~BLK_FLAG_IOSTATS_PASSTHROUGH;
>> -
>> -	ret = queue_limits_commit_update(disk->queue, &lim);
>> -	if (ret)
>> -		return ret;
>> -
>> -	return count;
>> +		lim->flags &= ~BLK_FLAG_IOSTATS_PASSTHROUGH;
>> +	return 0;
>>  }
>> +
>>  static ssize_t queue_nomerges_show(struct gendisk *disk, char *page)
>>  {
>>  	return queue_var_show((blk_queue_nomerges(disk->queue) << 1) |
>> @@ -391,12 +371,10 @@ static ssize_t queue_wc_show(struct gendisk *disk, char *page)
>>  	return sysfs_emit(page, "write through\n");
>>  }
>>  
>> -static ssize_t queue_wc_store(struct gendisk *disk, const char *page,
>> -			      size_t count)
>> +static int queue_wc_store(struct gendisk *disk, const char *page,
>> +		size_t count, struct queue_limits *lim)
>>  {
>> -	struct queue_limits lim;
>>  	bool disable;
>> -	int err;
>>  
>>  	if (!strncmp(page, "write back", 10)) {
>>  		disable = false;
>> @@ -407,15 +385,11 @@ static ssize_t queue_wc_store(struct gendisk *disk, const char *page,
>>  		return -EINVAL;
>>  	}
>>  
>> -	lim = queue_limits_start_update(disk->queue);
>>  	if (disable)
>> -		lim.flags |= BLK_FLAG_WRITE_CACHE_DISABLED;
>> +		lim->flags |= BLK_FLAG_WRITE_CACHE_DISABLED;
>>  	else
>> -		lim.flags &= ~BLK_FLAG_WRITE_CACHE_DISABLED;
>> -	err = queue_limits_commit_update(disk->queue, &lim);
>> -	if (err)
>> -		return err;
>> -	return count;
>> +		lim->flags &= ~BLK_FLAG_WRITE_CACHE_DISABLED;
>> +	return 0;
>>  }
>>  
>>  #define QUEUE_RO_ENTRY(_prefix, _name)			\
>> @@ -431,6 +405,13 @@ static struct queue_sysfs_entry _prefix##_entry = {	\
>>  	.store	= _prefix##_store,			\
>>  };
>>  
>> +#define QUEUE_LIM_RW_ENTRY(_prefix, _name)			\
>> +static struct queue_sysfs_entry _prefix##_entry = {	\
>> +	.attr		= { .name = _name, .mode = 0644 },	\
>> +	.show		= _prefix##_show,			\
>> +	.store_limit	= _prefix##_store,			\
>> +}
>> +
>>  #define QUEUE_RW_LOAD_MODULE_ENTRY(_prefix, _name)		\
>>  static struct queue_sysfs_entry _prefix##_entry = {		\
>>  	.attr		= { .name = _name, .mode = 0644 },	\
>> @@ -441,7 +422,7 @@ static struct queue_sysfs_entry _prefix##_entry = {		\
>>  
>>  QUEUE_RW_ENTRY(queue_requests, "nr_requests");
>>  QUEUE_RW_ENTRY(queue_ra, "read_ahead_kb");
>> -QUEUE_RW_ENTRY(queue_max_sectors, "max_sectors_kb");
>> +QUEUE_LIM_RW_ENTRY(queue_max_sectors, "max_sectors_kb");
>>  QUEUE_RO_ENTRY(queue_max_hw_sectors, "max_hw_sectors_kb");
>>  QUEUE_RO_ENTRY(queue_max_segments, "max_segments");
>>  QUEUE_RO_ENTRY(queue_max_integrity_segments, "max_integrity_segments");
>> @@ -457,7 +438,7 @@ QUEUE_RO_ENTRY(queue_io_opt, "optimal_io_size");
>>  QUEUE_RO_ENTRY(queue_max_discard_segments, "max_discard_segments");
>>  QUEUE_RO_ENTRY(queue_discard_granularity, "discard_granularity");
>>  QUEUE_RO_ENTRY(queue_max_hw_discard_sectors, "discard_max_hw_bytes");
>> -QUEUE_RW_ENTRY(queue_max_discard_sectors, "discard_max_bytes");
>> +QUEUE_LIM_RW_ENTRY(queue_max_discard_sectors, "discard_max_bytes");
>>  QUEUE_RO_ENTRY(queue_discard_zeroes_data, "discard_zeroes_data");
>>  
>>  QUEUE_RO_ENTRY(queue_atomic_write_max_sectors, "atomic_write_max_bytes");
>> @@ -477,11 +458,11 @@ QUEUE_RO_ENTRY(queue_max_open_zones, "max_open_zones");
>>  QUEUE_RO_ENTRY(queue_max_active_zones, "max_active_zones");
>>  
>>  QUEUE_RW_ENTRY(queue_nomerges, "nomerges");
>> -QUEUE_RW_ENTRY(queue_iostats_passthrough, "iostats_passthrough");
>> +QUEUE_LIM_RW_ENTRY(queue_iostats_passthrough, "iostats_passthrough");
>>  QUEUE_RW_ENTRY(queue_rq_affinity, "rq_affinity");
>>  QUEUE_RW_ENTRY(queue_poll, "io_poll");
>>  QUEUE_RW_ENTRY(queue_poll_delay, "io_poll_delay");
>> -QUEUE_RW_ENTRY(queue_wc, "write_cache");
>> +QUEUE_LIM_RW_ENTRY(queue_wc, "write_cache");
>>  QUEUE_RO_ENTRY(queue_fua, "fua");
>>  QUEUE_RO_ENTRY(queue_dax, "dax");
>>  QUEUE_RW_ENTRY(queue_io_timeout, "io_timeout");
>> @@ -494,10 +475,10 @@ static struct queue_sysfs_entry queue_hw_sector_size_entry = {
>>  	.show = queue_logical_block_size_show,
>>  };
>>  
>> -QUEUE_RW_ENTRY(queue_rotational, "rotational");
>> -QUEUE_RW_ENTRY(queue_iostats, "iostats");
>> -QUEUE_RW_ENTRY(queue_add_random, "add_random");
>> -QUEUE_RW_ENTRY(queue_stable_writes, "stable_writes");
>> +QUEUE_LIM_RW_ENTRY(queue_rotational, "rotational");
>> +QUEUE_LIM_RW_ENTRY(queue_iostats, "iostats");
>> +QUEUE_LIM_RW_ENTRY(queue_add_random, "add_random");
>> +QUEUE_LIM_RW_ENTRY(queue_stable_writes, "stable_writes");
>>  
>>  #ifdef CONFIG_BLK_WBT
>>  static ssize_t queue_var_store64(s64 *var, const char *page)
>> @@ -695,7 +676,7 @@ queue_attr_store(struct kobject *kobj, struct attribute *attr,
>>  	struct request_queue *q = disk->queue;
>>  	ssize_t res;
>>  
>> -	if (!entry->store)
>> +	if (!entry->store_limit && !entry->store)
>>  		return -EIO;
>>  
>>  	/*
>> @@ -706,11 +687,24 @@ queue_attr_store(struct kobject *kobj, struct attribute *attr,
>>  	if (entry->load_module)
>>  		entry->load_module(disk, page, length);
>>  
>> -	blk_mq_freeze_queue(q);
>>  	mutex_lock(&q->sysfs_lock);
>> -	res = entry->store(disk, page, length);
>> -	mutex_unlock(&q->sysfs_lock);
>> +	blk_mq_freeze_queue(q);
> 
> Order between freeze and ->sysfs_lock is changed, and it may cause new
> lockdep warning because we may freeze queue first before acquiring
> ->sysfs_lock in del_gendisk().
> 
On contrary, in elevator_disable() and elevator_switch() we acquire 
->sysfs_lock first before freezing the queue. I think this is a mess and 
we need to fix ordering. We need to decide ordering rules. IMO, the 
correct order should be to acquire ->sysfs_lock before freezing queue. 
Likewise with this patch now we acquire ->limits_lock before freezing the 
queue.

Thanks,
--Nilay


