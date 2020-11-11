Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDC22AEAFC
	for <lists+nbd@lfdr.de>; Wed, 11 Nov 2020 09:21:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 37B6220312; Wed, 11 Nov 2020 08:21:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Nov 11 08:21:12 2020
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
	by bendel.debian.org (Postfix) with ESMTP id B7B59202E5
	for <lists-other-nbd@bendel.debian.org>; Wed, 11 Nov 2020 08:04:20 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.481 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_MSPIKE_H2=-0.001, UNPARSEABLE_RELAY=0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 5Nubvu-5gIHR for <lists-other-nbd@bendel.debian.org>;
	Wed, 11 Nov 2020 08:04:16 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 13535 seconds by postgrey-1.36 at bendel; Wed, 11 Nov 2020 08:04:16 UTC
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "userp2120.oracle.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 320942020A
	for <nbd@other.debian.org>; Wed, 11 Nov 2020 08:04:16 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AB49Tbn187079;
	Wed, 11 Nov 2020 04:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : mime-version :
 content-type; s=corp-2020-01-29;
 bh=EwuOibuX72u5GW/vr3IZET1mbk4Qqp2f1lpQhsZMo3U=;
 b=rdxx8bfCoz66U7/JxdRXyqosHLyk6104gocou3/pxKr+MBaHN9z+JG22xyBjdFrs/toj
 u8kyE9Mnx40f+onFhQWnASdg9eewdpqao7JjD8N8PDe0bDGwb4iBUgCzzxwXH2tPfd4b
 ZewD9ZDiq4ttMBKnV5hFCYBDOG9JBlIzwIQL8q1J/Y6q7a+0GcQKjASc2OGvEo13qqVS
 YW2PdJ4GC1fZvqx8aM04P1FnQraTmrtlR84Q48lCpCKfWOIJkugsvGV1CkUq/whUbI2D
 eu9b4yGyWVKNklkWbsL8Eg4w7p+siPP69BiWWD0dUAtW6doZkGUQe3KqPOb7wn/WWPSd sQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by userp2120.oracle.com with ESMTP id 34p72en941-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 11 Nov 2020 04:18:21 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AB4Arf2138947;
	Wed, 11 Nov 2020 04:18:20 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by aserp3020.oracle.com with ESMTP id 34p5g179j7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Nov 2020 04:18:20 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0AB4IBdx000879;
	Wed, 11 Nov 2020 04:18:11 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 10 Nov 2020 20:18:09 -0800
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Justin Sanders <justin@coraid.com>,
        Josef Bacik <josef@toxicpanda.com>, Ilya Dryomov <idryomov@gmail.com>,
        Jack Wang <jinpu.wang@cloud.ionos.com>,
        "Michael S. Tsirkin"
 <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Roger Pau =?utf-8?Q?Monn=C3=A9?=
 <roger.pau@citrix.com>,
        Minchan Kim <minchan@kernel.org>, Mike Snitzer
 <snitzer@redhat.com>,
        Song Liu <song@kernel.org>,
        "Martin K. Petersen"
 <martin.petersen@oracle.com>,
        dm-devel@redhat.com, linux-block@vger.kernel.org,
        drbd-dev@tron.linbit.com, nbd@other.debian.org,
        ceph-devel@vger.kernel.org, xen-devel@lists.xenproject.org,
        linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
        linux-scsi@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 04/24] sd: update the bdev size in sd_revalidate_disk
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle
Message-ID: <yq1tutwedcb.fsf@ca-mkp.ca.oracle.com>
References: <20201106190337.1973127-1-hch@lst.de>
	<20201106190337.1973127-5-hch@lst.de>
Date: Tue, 10 Nov 2020 23:18:05 -0500
In-Reply-To: <20201106190337.1973127-5-hch@lst.de> (Christoph Hellwig's
	message of "Fri, 6 Nov 2020 20:03:16 +0100")
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9801 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 mlxlogscore=887 suspectscore=1
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011110019
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9801 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=877 mlxscore=0
 malwarescore=0 suspectscore=1 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011110019
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <7oJVulVdCZC.A.CRG.475qfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1053
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/yq1tutwedcb.fsf@ca-mkp.ca.oracle.com
Resent-Date: Wed, 11 Nov 2020 08:21:12 +0000 (UTC)


Christoph,

> This avoids the extra call to revalidate_disk_size in sd_rescan and
> is otherwise a no-op because the size did not change, or we are in
> the probe path.

Acked-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering

