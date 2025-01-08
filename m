Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5BDA0594E
	for <lists+nbd@lfdr.de>; Wed,  8 Jan 2025 12:12:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B21EE2077B; Wed,  8 Jan 2025 11:12:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jan  8 11:12:09 2025
Old-Return-Path: <nilay@linux.ibm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3B07B2074A
	for <lists-other-nbd@bendel.debian.org>; Wed,  8 Jan 2025 10:54:59 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.799 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id KkaY9UoPZjAV for <lists-other-nbd@bendel.debian.org>;
	Wed,  8 Jan 2025 10:54:54 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.pphosted.com", Issuer "Sectigo RSA Organization Validation Secure Server CA" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 08EF620738
	for <nbd@other.debian.org>; Wed,  8 Jan 2025 10:54:53 +0000 (UTC)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507NwcRG023766;
	Wed, 8 Jan 2025 10:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=5hG07b
	68UgfFh1mkQipWBlv55l2zeHeSTf1bLkQkuos=; b=M5uiYDHVAcYe7VHhAa6Cw3
	kJG4bcYArFb+R4QqhCAQ0AqkGIB7NhCE3bFmLUTCorU/EdwO4qGom/nWVttv3qoz
	l2upbtAFyZGEMYw/G+IcZTWbqXbhrbIrglRJpWTbBEYWnVrkeq8maOVySGRmhBHr
	sN0kKkyiy1JiV5eB9ckj4hWdL5SRqVnyElZ4O0Ciu9hzLcOjhUeqjB2ey538fTke
	dBau4lJxssPqAzN2kVIChFUwzsdA80aa2iEoNSbPsnuDBCOI3NS6L61ulIbZh33n
	SoRcdpIuG/Hl02J05cWIiT83lMDlRMRin98x6gS1m2/pXAkZxPRoPrpmH/jdKMYg
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 441edj2f98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 10:54:41 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5089NLGU013648;
	Wed, 8 Jan 2025 10:54:40 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43ygany9se-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 10:54:40 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 508AsdSd19071504
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jan 2025 10:54:39 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F2C555805F;
	Wed,  8 Jan 2025 10:54:38 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E932658043;
	Wed,  8 Jan 2025 10:54:35 +0000 (GMT)
Received: from [9.109.198.241] (unknown [9.109.198.241])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  8 Jan 2025 10:54:35 +0000 (GMT)
Message-ID: <2413a086-db69-4e55-a3eb-6f5850628132@linux.ibm.com>
Date: Wed, 8 Jan 2025 16:24:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] block: don't update BLK_FEAT_POLL in
 __blk_mq_update_nr_hw_queues
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Damien Le Moal <dlemoal@kernel.org>, Ming Lei <ming.lei@redhat.com>,
        linux-block@vger.kernel.org, linux-nvme@lists.infradead.org,
        nbd@other.debian.org, linux-scsi@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net
References: <20250108092520.1325324-1-hch@lst.de>
 <20250108092520.1325324-4-hch@lst.de>
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <20250108092520.1325324-4-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4g16UznjjYa-fYLp2nneAuxFsf-shWbg
X-Proofpoint-ORIG-GUID: 4g16UznjjYa-fYLp2nneAuxFsf-shWbg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501080085
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ZU8yHMZpLhH.A._P8O.J2lfnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3295
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/2413a086-db69-4e55-a3eb-6f5850628132@linux.ibm.com
Resent-Date: Wed,  8 Jan 2025 11:12:09 +0000 (UTC)



On 1/8/25 2:55 PM, Christoph Hellwig wrote:
> When __blk_mq_update_nr_hw_queues changes the number of tag sets, it
> might have to disable poll queues.  Currently it does so by adjusting
> the BLK_FEAT_POLL, which is a bit against the intent of features that
> describe hardware / driver capabilities, but more importantly causes
> nasty lock order problems with the broadly held freeze when updating the
> number of hardware queues and the limits lock.  Fix this by leaving
> BLK_FEAT_POLL alone, and instead check for the number of poll queues in
> the bio submission and poll handlers.  While this adds extra work to the
> fast path, the variables are in cache lines used by these operations
> anyway, so it should be cheap enough.
> 
> Fixes: 8023e144f9d6 ("block: move the poll flag to queue_limits")
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good to me:

Reviewed-by: Nilay Shroff <nilay@linux.ibm.com>


