Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6A82318D1
	for <lists+nbd@lfdr.de>; Wed, 29 Jul 2020 06:51:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 42CAA2035B; Wed, 29 Jul 2020 04:51:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jul 29 04:51:13 2020
Old-Return-Path: <martin.petersen@oracle.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,
	UNPARSEABLE_RELAY autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9833D2034F
	for <lists-other-nbd@bendel.debian.org>; Wed, 29 Jul 2020 04:34:08 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.381 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
	UNPARSEABLE_RELAY=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id TBOF5e1wvrHM for <lists-other-nbd@bendel.debian.org>;
	Wed, 29 Jul 2020 04:34:04 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "userp2130.oracle.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id E46FF203CA
	for <nbd@other.debian.org>; Wed, 29 Jul 2020 04:34:03 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06T4X5NE120312;
	Wed, 29 Jul 2020 04:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : mime-version :
 content-type; s=corp-2020-01-29;
 bh=h53xFNPOnAu2za+HlgzOC+33Caul8s3PIGMAjL9zqYc=;
 b=MUANNLB3paLQES1ITCwvWFQWzJZAFz7rsJkF3D6lhZO3wRENywTiG0r+5okWKkGJ2N2M
 DaGTv20AHMYg355l9ym2tW1wVzEVZfTRSL7rjD5IUZkPYC+JW5RHvEwNR6deIoJMP3fE
 vm85fX/uL2WSTVv4X7PydVVBu8Ij9SyFYxJzsk/Qrysb8Kw0RNxxwExX7tquU7glJRud
 mp56sD5XgSnc/DW+CDlCnIO0jaY7bONl+rx5yQx/tL6inf/00RKjw65HiJjYXxY21VPd
 VcHpdd/DrGG4sD2M3hwfszIYUQymWQs2xeIiKfHeKOQGZZsJ/pBsWvVANuIeFNVm/GlP 7Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by userp2130.oracle.com with ESMTP id 32hu1jb81y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 29 Jul 2020 04:33:22 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06T4XMJD078386;
	Wed, 29 Jul 2020 04:33:22 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by userp3030.oracle.com with ESMTP id 32hu5u1w9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Jul 2020 04:33:11 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06T4X32F028038;
	Wed, 29 Jul 2020 04:33:03 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 28 Jul 2020 21:33:03 -0700
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
        Christoph Hellwig
 <hch@lst.de>, linux-kernel@vger.kernel.org,
        Keith Busch
 <kbusch@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
        "open
 list:BLOCK LAYER" <linux-block@vger.kernel.org>,
        Sagi Grimberg
 <sagi@grimberg.me>, Jens Axboe <axboe@kernel.dk>,
        "open list:NVM EXPRESS
 DRIVER" <linux-nvme@lists.infradead.org>,
        "open list:SCSI CDROM DRIVER"
 <linux-scsi@vger.kernel.org>,
        Tejun Heo <tj@kernel.org>, Bart Van Assche
 <bvanassche@acm.org>,
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
Message-ID: <yq1bljz7y9q.fsf@ca-mkp.ca.oracle.com>
References: <20200721105239.8270-1-mlevitsk@redhat.com>
	<20200721105239.8270-3-mlevitsk@redhat.com>
	<20200721151437.GB10620@lst.de> <yq1zh7sfedj.fsf@ca-mkp.ca.oracle.com>
	<f16aba1020019530564f0869a67951282104a5d2.camel@redhat.com>
Date: Wed, 29 Jul 2020 00:32:55 -0400
In-Reply-To: <f16aba1020019530564f0869a67951282104a5d2.camel@redhat.com>
	(Maxim Levitsky's message of "Wed, 22 Jul 2020 12:11:17 +0300")
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9696 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=1 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007290031
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9696 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 clxscore=1015
 malwarescore=0 spamscore=0 suspectscore=1 bulkscore=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007290031
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <_08xMhSisR.A.o5D.BBQIfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/928
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/yq1bljz7y9q.fsf@ca-mkp.ca.oracle.com
Resent-Date: Wed, 29 Jul 2020 04:51:13 +0000 (UTC)


Hi Maxim,

> Instead of this adding blk_is_valid_logical_block_size allowed me to
> trivially convert most of the uses.
>
> For RFC I converted only some drivers that I am more familiar with
> and/or can test but I can remove the driver's own checks in most other
> drivers with low chance of introducing a bug, even if I can't test the
> driver.
>
> What do you think?
>
> I can also both make blk_queue_logical_block_size return an error
> value, and have blk_is_valid_logical_block_size and use either of
> these checks, depending on the driver with eventual goal of
> un-exporting blk_is_valid_logical_block_size.

My concern is that blk_is_valid_logical_block_size() deviates from the
regular block layer convention where the function to set a given queue
limit will either adjust the passed value or print a warning.

I guess I won't entirely object to having the actual check in a helper
function that drivers with a peculiar initialization pattern can
use. And then make blk_queue_logical_block_size() call that helper as
well to validate the lbs.

But I do think that blk_queue_logical_block_size() should be the
preferred interface and that, where possible, drivers should be updated
to check the return value of that.

-- 
Martin K. Petersen	Oracle Linux Engineering

