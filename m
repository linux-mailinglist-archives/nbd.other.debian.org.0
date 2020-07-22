Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id F384222910F
	for <lists+nbd@lfdr.de>; Wed, 22 Jul 2020 08:42:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D90EB20407; Wed, 22 Jul 2020 06:42:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jul 22 06:42:09 2020
Old-Return-Path: <martin.petersen@oracle.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id F06EB20407
	for <lists-other-nbd@bendel.debian.org>; Wed, 22 Jul 2020 06:24:31 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.481 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_MSPIKE_H2=-0.001, UNPARSEABLE_RELAY=0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id O7dcpJBEX5w7 for <lists-other-nbd@bendel.debian.org>;
	Wed, 22 Jul 2020 06:24:27 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 11971 seconds by postgrey-1.36 at bendel; Wed, 22 Jul 2020 06:24:27 UTC
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "userp2130.oracle.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 8E2A9203C6
	for <nbd@other.debian.org>; Wed, 22 Jul 2020 06:24:27 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06M2kTjo191446;
	Wed, 22 Jul 2020 02:55:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : mime-version :
 content-type; s=corp-2020-01-29;
 bh=01BXubBTTggiGme5bAGTUB+IF85y9Gt5mJRvOB950ac=;
 b=Ert4ww4qHWKQEvayACm71Ls9WksxesZoOaQuXn1rooMPeky0Jrb3Txsjhfab7151opH+
 +ba9k2HaDjO+952t0cWNI9dQ5WIUYlfWf21ewpsJhWYjcp3N0pcTJv58VOOiL/rw4ZJ6
 iz8Tt3rOrUGPL774E+aOOMdpr1AJ4rPAQVYkJ8tuwulHR8WsPhlqGNhCTMtVwJGZI8Su
 HIBl9tQrmPPnenq/MvlY3LRHb4yzdgqsGtAjLjY176yMEaePZyb/9GiUf2AUdZxzL18+
 SsUZlrUq97Om51YkiNCIV1uh+Ie3EhzxivvOSUhEO/vIHZqNevq4QRm6YstexeMtuoCD CA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by userp2130.oracle.com with ESMTP id 32brgrgmt4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 Jul 2020 02:55:24 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06M2m6rK048369;
	Wed, 22 Jul 2020 02:55:24 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by aserp3030.oracle.com with ESMTP id 32e9usdjva-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Jul 2020 02:55:23 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06M2tDDp005896;
	Wed, 22 Jul 2020 02:55:13 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 22 Jul 2020 02:55:13 +0000
To: Christoph Hellwig <hch@lst.de>
Cc: Maxim Levitsky <mlevitsk@redhat.com>, linux-kernel@vger.kernel.org,
        Keith Busch <kbusch@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
        "open list:BLOCK LAYER" <linux-block@vger.kernel.org>,
        Sagi Grimberg
 <sagi@grimberg.me>, Jens Axboe <axboe@kernel.dk>,
        "open list:NVM EXPRESS
 DRIVER" <linux-nvme@lists.infradead.org>,
        "open list:SCSI CDROM DRIVER"
 <linux-scsi@vger.kernel.org>,
        Tejun Heo <tj@kernel.org>, Bart Van Assche
 <bvanassche@acm.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Jason Wang
 <jasowang@redhat.com>,
        Maxim Levitsky <maximlevitsky@gmail.com>,
        Stefan
 Hajnoczi <stefanha@redhat.com>,
        Colin Ian King
 <colin.king@canonical.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Paolo
 Bonzini <pbonzini@redhat.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Ajay Joshi <ajay.joshi@wdc.com>,
        Ming Lei <ming.lei@redhat.com>,
        "open
 list:SONY MEMORYSTICK SUBSYSTEM" <linux-mmc@vger.kernel.org>,
        Satya
 Tangirala <satyat@google.com>,
        "open list:NETWORK BLOCK DEVICE (NBD)"
 <nbd@other.debian.org>,
        Hou Tao <houtao1@huawei.com>, Jens Axboe
 <axboe@fb.com>,
        "open list:VIRTIO CORE AND NET DRIVERS"
 <virtualization@lists.linux-foundation.org>,
        "James E.J. Bottomley"
 <jejb@linux.ibm.com>,
        Alex Dubov <oakad@yahoo.com>
Subject: Re: [PATCH 02/10] block: virtio-blk: check logical block size
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1zh7sfedj.fsf@ca-mkp.ca.oracle.com>
References: <20200721105239.8270-1-mlevitsk@redhat.com>
	<20200721105239.8270-3-mlevitsk@redhat.com>
	<20200721151437.GB10620@lst.de>
Date: Tue, 21 Jul 2020 22:55:07 -0400
In-Reply-To: <20200721151437.GB10620@lst.de> (Christoph Hellwig's message of
	"Tue, 21 Jul 2020 17:14:37 +0200")
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9689 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 bulkscore=0 malwarescore=0 suspectscore=1 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007220017
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9689 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 spamscore=0
 impostorscore=0 suspectscore=1 adultscore=0 clxscore=1011 mlxlogscore=999
 priorityscore=1501 phishscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007220017
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Wanw11Y5ABJ.A.VG.B_9FfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/921
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/yq1zh7sfedj.fsf@ca-mkp.ca.oracle.com
Resent-Date: Wed, 22 Jul 2020 06:42:09 +0000 (UTC)


Christoph,

> Hmm, I wonder if we should simply add the check and warning to
> blk_queue_logical_block_size and add an error in that case.  Then
> drivers only have to check the error return, which might add a lot
> less boiler plate code.

Yep, I agree.

-- 
Martin K. Petersen	Oracle Linux Engineering

