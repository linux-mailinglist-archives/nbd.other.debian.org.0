Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F48D22DA26
	for <lists+nbd@lfdr.de>; Sun, 26 Jul 2020 00:08:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E6FEF204E1; Sat, 25 Jul 2020 22:08:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Jul 25 22:08:10 2020
Old-Return-Path: <michael.christie@oracle.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2 autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9409B2047D
	for <lists-other-nbd@bendel.debian.org>; Sat, 25 Jul 2020 21:50:09 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.382 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id aiD7uIGa9zWX for <lists-other-nbd@bendel.debian.org>;
	Sat, 25 Jul 2020 21:50:05 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 11235 seconds by postgrey-1.36 at bendel; Sat, 25 Jul 2020 21:50:05 UTC
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "aserp2120.oracle.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 043C620459
	for <nbd@other.debian.org>; Sat, 25 Jul 2020 21:50:04 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06PIcTPv013083;
	Sat, 25 Jul 2020 18:42:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2020-01-29; bh=eJEpSUfkla/agpQCH51QK4tTiRteg4fcYTB66EtN8tQ=;
 b=Yx8cy7p67Y5KTFOgF6BIWxEauFiKJbYC5hs59KFAKYaoDXQ7q0/QJZrmXubBYVNqyj9/
 +yctd08tOKOjvwNMth5YbSOPZljx5/NBNkr+WVThUqXCaB3K+1s5PEmUpGE2kzQHFhkU
 cweo6BAulel5xko8d1VwvdDXo2ni12KqIFskMmGf1cKNZZQ6a4o+7ZMdDTsubU8DS6Og
 2Fz3t4uJECScBEr8o/X3IXFn5ioMFhjZ2aoRDMsf5v1TxLOUchi2cJOlH+bdNedfrOzm
 S1Jb5x/wgCAzvNQNgkp1OPFsZ10S1wGYOLqO+I1G3NYpuVctqVzoVmOeyn3Tn2/0ernd qQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by aserp2120.oracle.com with ESMTP id 32gcpksed4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 25 Jul 2020 18:42:40 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06PIdCSi098561;
	Sat, 25 Jul 2020 18:42:39 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by userp3030.oracle.com with ESMTP id 32ghx0kp29-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 25 Jul 2020 18:42:39 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06PIgbX8020632;
	Sat, 25 Jul 2020 18:42:38 GMT
Received: from [20.15.0.12] (/73.88.28.6)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Sat, 25 Jul 2020 11:42:37 -0700
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH] nbd: add missed destroy_workqueue when nbd_start_device
 fails
From: Michael Christie <michael.christie@oracle.com>
In-Reply-To: <1595644070-26293-1-git-send-email-liheng40@huawei.com>
Date: Sat, 25 Jul 2020 13:42:35 -0500
Cc: josef@toxicpanda.com, axboe@kernel.dk, linux-block@vger.kernel.org,
        nbd@other.debian.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <6A2BE179-5545-4486-81B6-5CB9020F9522@oracle.com>
References: <1595644070-26293-1-git-send-email-liheng40@huawei.com>
To: Li Heng <liheng40@huawei.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9693 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007250154
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9693 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1011 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007250154
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <5W5CuIBV5wN.A.5mB.K1KHfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/925
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/6A2BE179-5545-4486-81B6-5CB9020F9522@oracle.com
Resent-Date: Sat, 25 Jul 2020 22:08:10 +0000 (UTC)



> On Jul 24, 2020, at 9:27 PM, Li Heng <liheng40@huawei.com> wrote:
>=20
> destroy_workqueue() should be called to destroy ndev->tx_wq
> when nbd_start_device init resources fails.
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Li Heng <liheng40@huawei.com>
> ---
> drivers/block/nbd.c | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index ce7e9f22..45e0a9f4 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -4,7 +4,7 @@
>  *
>  * Note that you can not swap over this thing, yet. Seems to work but
>  * deadlocks sometimes - you can not swap over TCP in general.
> - *=20
> + *
>  * Copyright 1997-2000, 2008 Pavel Machek <pavel@ucw.cz>
>  * Parts copyright 2001 Steven Whitehouse <steve@chygwyn.com>
>  *
> @@ -1270,6 +1270,7 @@ static int nbd_start_device(struct nbd_device =
*nbd)
> 	error =3D device_create_file(disk_to_dev(nbd->disk), &pid_attr);
> 	if (error) {
> 		dev_err(disk_to_dev(nbd->disk), "device_create_file =
failed!\n");
> +		destroy_workqueue(nbd->recv_workq);
> 		return error;
> 	}
> 	set_bit(NBD_RT_HAS_PID_FILE, &config->runtime_flags);
> @@ -1291,6 +1292,7 @@ static int nbd_start_device(struct nbd_device =
*nbd)
> 			 */
> 			if (i)
> 				flush_workqueue(nbd->recv_workq);
> +			destroy_workqueue(nbd->recv_workq);
> 			return -ENOMEM;
> 		}
> 		sk_set_memalloc(config->socks[i]->sock->sk);

For the netlink error path, we end up cleaning up everything when =
nbd_config_put is called in the error path.

Are you seeing an issue with the ioctl interface and this code path? I =
thought normally if the the NBD_DO_IT ioctl fails, then userspace closes =
the device and that does the nbd_config_put that will clean this up like =
is done in the netlink path.

If userspace is not closing the device and is trying to maybe retry the =
NBD_DO_IT ioctl or reuse the device some other way, then I think you =
need to also NULL nbd->task_recv, remove pid file, NULL recv_workq after =
you destroy for the cases nbd_config_put is called right after a =
failure.


