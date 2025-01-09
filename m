Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC48A074F2
	for <lists+nbd@lfdr.de>; Thu,  9 Jan 2025 12:42:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1F80B2062A; Thu,  9 Jan 2025 11:42:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jan  9 11:42:10 2025
Old-Return-Path: <nilay@linux.ibm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1CAED20614
	for <lists-other-nbd@bendel.debian.org>; Thu,  9 Jan 2025 11:25:06 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.799 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 1FThIGmjE_rN for <lists-other-nbd@bendel.debian.org>;
	Thu,  9 Jan 2025 11:25:00 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.pphosted.com", Issuer "Sectigo RSA Organization Validation Secure Server CA" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id AAA0A205ED
	for <nbd@other.debian.org>; Thu,  9 Jan 2025 11:24:59 +0000 (UTC)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5093qwa3005688;
	Thu, 9 Jan 2025 11:24:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Y7iVEc
	WO5At8egsQ1XIfYQNkwCODsRYagLwt487qBFk=; b=YZWk4C2RfFXydUbFgYT14m
	TzqaEbrNgUjDIECjVfJukKjBgVJavfE2HZdaPrGEFk9ssFEN7jnKMoYAIy5N6c/0
	KjqzJOaq+Kh0wiA5g2dEEEjrluFrlEqmtvrGRn8cDmCqidrEfjQJMfTlFiOMSGfe
	cBIcemW9rG6KEfcRizevDVKseYa1J4pjIP7J/7vxo/ge7Yd/4Cjizd1o48h/Duwb
	cZWAuNoyTS64xiHYRC69YAtfCowSCAj6Lyy8Pxa7Sd+foFUtzOCB7uf1p2YQ/t4E
	hbAKzfMIegWqb/CHwmqA60DU51Dai3NyJSlvKgqITXi9HmLwiMJFFRVPCq4diLmw
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4426xc9sxb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 11:24:45 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5097jukl008851;
	Thu, 9 Jan 2025 11:24:44 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43yfq04ybm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 11:24:44 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 509BOhM418154092
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jan 2025 11:24:43 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7DF3358058;
	Thu,  9 Jan 2025 11:24:43 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D33B858059;
	Thu,  9 Jan 2025 11:24:39 +0000 (GMT)
Received: from [9.171.90.198] (unknown [9.171.90.198])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Jan 2025 11:24:39 +0000 (GMT)
Message-ID: <279f282c-1fc3-4771-8460-c1a980fb0517@linux.ibm.com>
Date: Thu, 9 Jan 2025 16:54:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] block: fix docs for freezing of queue limits updates
To: John Garry <john.g.garry@oracle.com>, Christoph Hellwig <hch@lst.de>,
        Jens Axboe <axboe@kernel.dk>
Cc: Damien Le Moal <dlemoal@kernel.org>, Ming Lei <ming.lei@redhat.com>,
        linux-block@vger.kernel.org, linux-nvme@lists.infradead.org,
        nbd@other.debian.org, linux-scsi@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net
References: <20250107063120.1011593-1-hch@lst.de>
 <20250107063120.1011593-2-hch@lst.de>
 <33386009-9d1b-4a7f-96a5-a2f0ed2fb075@oracle.com>
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <33386009-9d1b-4a7f-96a5-a2f0ed2fb075@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HJ1uIGvels0GVoFE-W6QTYp62ZTRBanU
X-Proofpoint-ORIG-GUID: HJ1uIGvels0GVoFE-W6QTYp62ZTRBanU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxlogscore=916 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501090087
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <6mi8phnK3XD.A.mVtD.SY7fnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3321
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/279f282c-1fc3-4771-8460-c1a980fb0517@linux.ibm.com
Resent-Date: Thu,  9 Jan 2025 11:42:10 +0000 (UTC)



On 1/9/25 4:49 PM, John Garry wrote:
> On 07/01/2025 06:30, Christoph Hellwig wrote:
>> queue_limits_commit_update is the function that needs to operate on a
>> frozen queue, not queue_limits_start_update.  Update the kerneldoc
>> comments to reflect that.
>>
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>> ---
>>   block/blk-settings.c   | 3 ++-
>>   include/linux/blkdev.h | 3 +--
>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/block/blk-settings.c b/block/blk-settings.c
>> index 8f09e33f41f6..b6b8c580d018 100644
>> --- a/block/blk-settings.c
>> +++ b/block/blk-settings.c
>> @@ -413,7 +413,8 @@ int blk_set_default_limits(struct queue_limits *lim)
>>    * @lim:    limits to apply
>>    *
>>    * Apply the limits in @lim that were obtained from queue_limits_start_update()
>> - * and updated by the caller to @q.
>> + * and updated by the caller to @q.  The caller must have frozen the queue or
>> + * ensure that there are outstanding I/Os by other means.
> 
> is that a typo - /s/outstanding/ no outstanding/ ?
It's already fixed in v3 here: https://lore.kernel.org/all/20250109055810.1402918-2-hch@lst.de/

Thanks,
--Nilay

