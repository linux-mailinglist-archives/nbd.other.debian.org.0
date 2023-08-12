Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2EA77A150
	for <lists+nbd@lfdr.de>; Sat, 12 Aug 2023 19:21:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id AF35C205C8; Sat, 12 Aug 2023 17:21:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Aug 12 17:21:11 2023
Old-Return-Path: <hca@linux.ibm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1FCA5205B3
	for <lists-other-nbd@bendel.debian.org>; Sat, 12 Aug 2023 17:04:29 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.922 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id qbP7yu8Pua8q for <lists-other-nbd@bendel.debian.org>;
	Sat, 12 Aug 2023 17:04:22 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.pphosted.com", Issuer "Sectigo RSA Organization Validation Secure Server CA" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id CF448205AE
	for <nbd@other.debian.org>; Sat, 12 Aug 2023 17:04:18 +0000 (UTC)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37CH3qnI003858;
	Sat, 12 Aug 2023 17:04:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=SmhC/43SzCGVPkGdp3KGSK3CuIqDXI2hE9Fo6bvJRhg=;
 b=g2vc94rrRIGiotOUpbeuHdPF7+CMVjaL7CY/ATdYaEw09HU7QsqJrfMW3Qozqm6zP5Ho
 gC0Si7zk5XlF1VAAt4Hhb7Awjms39fsC5r0Ca6bmLHvKda1lay2h1VObAs+PyGfJoEbs
 z//n0Zb31EHljgmvfDnHfBz27ItovSCrL6GZIYn2tc75+mjX23zEf0T/WCr0fAWBo8jG
 jwqye8rbXfqZhc888cZsAKmIqOG16//qBvgSl8JgdN60+cEV/1v4AOuWVRpHFOJiSK5c
 AydRlhTTCxyDhSMQ+IzZG+fRlmJS0TCO7OFZtNHaBVwPtGQY7+lTtkA2LkiFwufgT6cw aA== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3see538032-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 12 Aug 2023 17:04:06 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37CF8Vqu017891;
	Sat, 12 Aug 2023 17:04:05 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3se376m5gv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 12 Aug 2023 17:04:05 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37CH42v544040552
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Aug 2023 17:04:02 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A303520043;
	Sat, 12 Aug 2023 17:04:02 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9F63A20040;
	Sat, 12 Aug 2023 17:04:01 +0000 (GMT)
Received: from osiris (unknown [9.171.6.134])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Sat, 12 Aug 2023 17:04:01 +0000 (GMT)
Date: Sat, 12 Aug 2023 19:04:00 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>,
        Jens Axboe <axboe@kernel.dk>, Denis Efremov <efremov@linux.com>,
        Josef Bacik <josef@toxicpanda.com>,
        Stefan Haberland <sth@linux.ibm.com>,
        Jan Hoeppner <hoeppner@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        "Darrick J . Wong" <djwong@kernel.org>, Chris Mason <clm@fb.com>,
        David Sterba <dsterba@suse.com>, linux-block@vger.kernel.org,
        nbd@other.debian.org, linux-s390@vger.kernel.org,
        linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 13/17] block: consolidate __invalidate_device and
 fsync_bdev
Message-ID: <20230812170400.11613-A-hca@linux.ibm.com>
References: <20230811100828.1897174-1-hch@lst.de>
 <20230811100828.1897174-14-hch@lst.de>
 <20230812105133.GA11904@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230812105133.GA11904@lst.de>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Xb4epEBeU7tcZo3chXqrwHPkKoiFkVd_
X-Proofpoint-GUID: Xb4epEBeU7tcZo3chXqrwHPkKoiFkVd_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-12_17,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 mlxscore=0 adultscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=750 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308120161
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <muk34COtOpP.A.CNG.H-71kB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2624
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230812170400.11613-A-hca@linux.ibm.com
Resent-Date: Sat, 12 Aug 2023 17:21:11 +0000 (UTC)

On Sat, Aug 12, 2023 at 12:51:33PM +0200, Christoph Hellwig wrote:
> The buildbot pointed out correctly (but rather late), that the special
> s390/dasd export needs a _MODULE postfix, so this will have to be
> folded in:
> 
> diff --git a/block/bdev.c b/block/bdev.c
> index 2a035be7f3ee90..a20263fa27a462 100644
> --- a/block/bdev.c
> +++ b/block/bdev.c
> @@ -967,7 +967,7 @@ void bdev_mark_dead(struct block_device *bdev, bool surprise)
>  
>  	invalidate_bdev(bdev);
>  }
> -#ifdef CONFIG_DASD
> +#ifdef CONFIG_DASD_MODULE

This needs to be

#if IS_ENABLED(CONFIG_DASD)

to cover both CONFIG_DASD=y and CONFIG_DASD=m.

