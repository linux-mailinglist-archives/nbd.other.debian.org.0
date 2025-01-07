Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 20241A038AC
	for <lists+nbd@lfdr.de>; Tue,  7 Jan 2025 08:18:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 07BBD20684; Tue,  7 Jan 2025 07:18:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jan  7 07:18:09 2025
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
	by bendel.debian.org (Postfix) with ESMTP id 8FB9B206EA
	for <lists-other-nbd@bendel.debian.org>; Tue,  7 Jan 2025 07:02:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.799 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id PW8OOkcd00fM for <lists-other-nbd@bendel.debian.org>;
	Tue,  7 Jan 2025 07:02:17 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.pphosted.com", Issuer "Sectigo RSA Organization Validation Secure Server CA" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 84151206C0
	for <nbd@other.debian.org>; Tue,  7 Jan 2025 07:02:17 +0000 (UTC)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507593Mv002225;
	Tue, 7 Jan 2025 07:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=iDpzfo
	PchipFD7MbgtJksJ+hOvAk54MTZjHHogr6pis=; b=RTOhc78xA9LBe5ufFwC5aX
	4ApeYlFmb37Inn3KhdkomDi8gVxw86hsG8NLq0OuLLL0/uv3Mw9+tTN+C29Y0SZT
	jsPu3Qx/thvofnt9P3dTXdR5arCSalkiwgZdyPpFnTpKRImxyJ8+iLZ7aBypWX3K
	sjcIuRhvSQvgiwwCg6/dmwmhcr1mAunuPLbAvgfzIbKyM+SF1XpnaqUkeXPmKchC
	Q0oBXuiheimPQFWmV1xSey8Sb/MlDS9Y4sq9BSS4hPhapV4k856YAQVW5a4CiW4C
	sCnjoABqpYNHRqNLvLZOEiLejOL+T8uF1dY8L4Cz74JORa/o8FMJylrHX7ilvpFQ
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 440gn53je6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 07:02:05 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5075Ic7b027938;
	Tue, 7 Jan 2025 07:02:04 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 43yhhk132y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 07:02:04 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 507723Ko44237136
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Jan 2025 07:02:03 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7879D58056;
	Tue,  7 Jan 2025 07:02:03 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5487E58052;
	Tue,  7 Jan 2025 07:02:00 +0000 (GMT)
Received: from [9.109.198.241] (unknown [9.109.198.241])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  7 Jan 2025 07:02:00 +0000 (GMT)
Message-ID: <668698f6-98d9-4e23-9ea9-ce78bafe64a5@linux.ibm.com>
Date: Tue, 7 Jan 2025 12:31:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] block: fix docs for freezing of queue limits updates
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Damien Le Moal <dlemoal@kernel.org>, Ming Lei <ming.lei@redhat.com>,
        linux-block@vger.kernel.org, linux-nvme@lists.infradead.org,
        nbd@other.debian.org, linux-scsi@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net
References: <20250107063120.1011593-1-hch@lst.de>
 <20250107063120.1011593-2-hch@lst.de>
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <20250107063120.1011593-2-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: pkJ2b0c5YF9oHYd8-ypYLNMBlxg7CFnd
X-Proofpoint-GUID: pkJ2b0c5YF9oHYd8-ypYLNMBlxg7CFnd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0
 mlxlogscore=823 spamscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501070056
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Psvz79njuzD.A.FwiH.xUNfnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3246
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/668698f6-98d9-4e23-9ea9-ce78bafe64a5@linux.ibm.com
Resent-Date: Tue,  7 Jan 2025 07:18:10 +0000 (UTC)



On 1/7/25 12:00 PM, Christoph Hellwig wrote:
> queue_limits_commit_update is the function that needs to operate on a
> frozen queue, not queue_limits_start_update.  Update the kerneldoc
> comments to reflect that.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  block/blk-settings.c   | 3 ++-
>  include/linux/blkdev.h | 3 +--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/block/blk-settings.c b/block/blk-settings.c
> index 8f09e33f41f6..b6b8c580d018 100644
> --- a/block/blk-settings.c
> +++ b/block/blk-settings.c
> @@ -413,7 +413,8 @@ int blk_set_default_limits(struct queue_limits *lim)
>   * @lim:	limits to apply
>   *
>   * Apply the limits in @lim that were obtained from queue_limits_start_update()
> - * and updated by the caller to @q.
> + * and updated by the caller to @q.  The caller must have frozen the queue or
> + * ensure that there are outstanding I/Os by other means.

Maybe typo: "ensure that there are *NO* outstanding I/Os by other means"

>   *
>   * Returns 0 if successful, else a negative error code.
>   */
> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> index 5d40af2ef971..e781d4e6f92d 100644
> --- a/include/linux/blkdev.h
> +++ b/include/linux/blkdev.h
> @@ -944,8 +944,7 @@ static inline unsigned int blk_boundary_sectors_left(sector_t offset,
>   * the caller can modify.  The caller must call queue_limits_commit_update()
>   * to finish the update.
>   *
> - * Context: process context.  The caller must have frozen the queue or ensured
> - * that there is outstanding I/O by other means.
> + * Context: process context.
>   */
>  static inline struct queue_limits
>  queue_limits_start_update(struct request_queue *q)

