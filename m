Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6DA77A176
	for <lists+nbd@lfdr.de>; Sat, 12 Aug 2023 19:45:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4F284205E5; Sat, 12 Aug 2023 17:45:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Aug 12 17:45:14 2023
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
	by bendel.debian.org (Postfix) with ESMTP id 8327820599
	for <lists-other-nbd@bendel.debian.org>; Sat, 12 Aug 2023 17:29:02 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.922 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id fgjtgaAZ2b24 for <lists-other-nbd@bendel.debian.org>;
	Sat, 12 Aug 2023 17:28:55 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.pphosted.com", Issuer "Sectigo RSA Organization Validation Secure Server CA" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 5519C20532
	for <nbd@other.debian.org>; Sat, 12 Aug 2023 17:28:55 +0000 (UTC)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37CHNMgH023840;
	Sat, 12 Aug 2023 17:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=jo9tUGz2NBLaraV0Fy8pU0HdtOrsA2G1C9AYSOSVFVw=;
 b=UzATMLkIcwO76ujXJ35usyxzag/z1bJs4pT9WZjl5ChF1M6UVCraoFVQJsAvOHa/KYg/
 nE16Rv5ovH4RxdMLy9JGU3lGv00qVRi5z1JV1MSV8S6AmdYvB7iUUooMua1Hw9QzR46x
 erjnqlgQJ/DbCAGhtjlmvZZH6NxQUfWmMyLjMiTqpwp/pBkq0bz4D3arCaRyMg4luu5M
 VNpyvwDi61uZtXHPkAKSs9d5ys3vxhOJ6T+9uzjU8e8J0TRV4Kiw67TrwZLVKI+J0luv
 G/g9myRATa8dqd61q48xH92QGkGCoNmVD17Q/wvaKEW8kHLbawZonFslmz3K8edsT/7h gg== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3seeear28r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 12 Aug 2023 17:28:45 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37CFF14Q017880;
	Sat, 12 Aug 2023 17:28:44 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3se376ma62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 12 Aug 2023 17:28:44 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37CHSfYB21627496
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Aug 2023 17:28:41 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8572620040;
	Sat, 12 Aug 2023 17:28:41 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9268220049;
	Sat, 12 Aug 2023 17:28:40 +0000 (GMT)
Received: from osiris (unknown [9.171.25.139])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Sat, 12 Aug 2023 17:28:40 +0000 (GMT)
Date: Sat, 12 Aug 2023 19:28:39 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Denis Efremov <efremov@linux.com>, Josef Bacik <josef@toxicpanda.com>,
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
Message-ID: <20230812172839.5133-A-hca@linux.ibm.com>
References: <20230811100828.1897174-1-hch@lst.de>
 <20230811100828.1897174-14-hch@lst.de>
 <20230812105133.GA11904@lst.de>
 <20230812170400.11613-A-hca@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230812170400.11613-A-hca@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: eISyKqPlMJTmSSfGr2SjH_KOd-4YXOVA
X-Proofpoint-ORIG-GUID: eISyKqPlMJTmSSfGr2SjH_KOd-4YXOVA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-12_17,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxlogscore=807
 mlxscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308120161
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <idV8CbHyEaI.A.kdF.qU81kB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2625
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230812172839.5133-A-hca@linux.ibm.com
Resent-Date: Sat, 12 Aug 2023 17:45:14 +0000 (UTC)

On Sat, Aug 12, 2023 at 07:04:00PM +0200, Heiko Carstens wrote:
> On Sat, Aug 12, 2023 at 12:51:33PM +0200, Christoph Hellwig wrote:
> > The buildbot pointed out correctly (but rather late), that the special
> > s390/dasd export needs a _MODULE postfix, so this will have to be
> > folded in:
> > 
> > diff --git a/block/bdev.c b/block/bdev.c
> > index 2a035be7f3ee90..a20263fa27a462 100644
> > --- a/block/bdev.c
> > +++ b/block/bdev.c
> > @@ -967,7 +967,7 @@ void bdev_mark_dead(struct block_device *bdev, bool surprise)
> >  
> >  	invalidate_bdev(bdev);
> >  }
> > -#ifdef CONFIG_DASD
> > +#ifdef CONFIG_DASD_MODULE
> 
> This needs to be
> 
> #if IS_ENABLED(CONFIG_DASD)
> 
> to cover both CONFIG_DASD=y and CONFIG_DASD=m.

..but of course you only want the export for CONFIG_DASD=m.
So just ignore my comment, please.

