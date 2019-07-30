Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id F090F7A2D4
	for <lists+nbd@lfdr.de>; Tue, 30 Jul 2019 10:09:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D6FA920259; Tue, 30 Jul 2019 08:09:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jul 30 08:09:08 2019
Old-Return-Path: <bob.liu@oracle.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,DKIM_VERIFIED,
	FOURLA,GMAIL,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 51A6120245
	for <lists-other-nbd@bendel.debian.org>; Tue, 30 Jul 2019 07:52:04 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.381 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, GMAIL=1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id P4bHjDtBA9zv for <lists-other-nbd@bendel.debian.org>;
	Tue, 30 Jul 2019 07:52:00 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 6343 seconds by postgrey-1.36 at bendel; Tue, 30 Jul 2019 07:52:00 UTC
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "userp2130.oracle.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 065F22015A
	for <nbd@other.debian.org>; Tue, 30 Jul 2019 07:51:59 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6U5xGTC035357;
	Tue, 30 Jul 2019 06:06:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=QrYtXYxZKE6mFRtyvgs8xGM4pvSd2ShYYnY5t0aH2kg=;
 b=A/PNe0b7QP2TCg+9js+WpJbScFGRlChxzOMzYEo3MT2pnLrz25J1qkn/gcKvMG0wI6b7
 BEN6VTlSoBACbmQ8A/X+5K+kFdwXE6nW0kQlOR0Eb3vBT9dIhz2Iwn+TqTLlB/btfSZ+
 UzbrdGp/URurPNf+Fo6mFHF4rbao4xG/FEc/Tt2qEhy5dZoQfQWsN8zdqIqNrODOrNNj
 n/AhyMnNdskatdquNY2un3PwMDO0ZvdlS4d4ilHReMG/7x+QiiJZR2oWIlO50aYgw0cw
 eThqySkb1r2S69jIRyEQ1ICz2zFs+E3WUM21A3rqJxIevWSLr81t8eZJh3jHgq8hzgFE Fw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by userp2130.oracle.com with ESMTP id 2u0e1tm7mr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Jul 2019 06:06:11 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6U62r7H122543;
	Tue, 30 Jul 2019 06:06:11 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by userp3020.oracle.com with ESMTP id 2u2ex9jdph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Jul 2019 06:06:11 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x6U664G7021624;
	Tue, 30 Jul 2019 06:06:07 GMT
Received: from [192.168.1.24] (/180.169.93.2)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Mon, 29 Jul 2019 23:06:04 -0700
Subject: Re: [PATCH v2] nbd_genl_status: null check for nla_nest_start
To: Navid Emamdoost <navid.emamdoost@gmail.com>, josef@toxicpanda.com
Cc: kjlu@umn.edu, smccaman@umn.edu, secalert@redhat.com, emamd001@umn.edu,
        Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
        nbd@other.debian.org, linux-kernel@vger.kernel.org
References: <20190729130912.7imtg3hfnvb4lt2y@MacBook-Pro-91.local>
 <20190729164226.22632-1-navid.emamdoost@gmail.com>
From: Bob Liu <bob.liu@oracle.com>
Message-ID: <1bcb2fc7-f64b-282c-36ab-eda9ccb4601d@oracle.com>
Date: Tue, 30 Jul 2019 14:05:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190729164226.22632-1-navid.emamdoost@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9333 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1907300064
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9333 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1907300064
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <0-GgTEMSq1O.A.KZF.ks_PdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/606
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/1bcb2fc7-f64b-282c-36ab-eda9ccb4601d@oracle.com
Resent-Date: Tue, 30 Jul 2019 08:09:08 +0000 (UTC)

On 7/30/19 12:42 AM, Navid Emamdoost wrote:
> nla_nest_start may fail and return NULL. The check is inserted, and
> errno is selected based on other call sites within the same source code.
> Update: removed extra new line.
> 
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> ---
>  drivers/block/nbd.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 9bcde2325893..2410812d1e82 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -2149,6 +2149,11 @@ static int nbd_genl_status(struct sk_buff *skb, struct genl_info *info)
>  	}
>  
>  	dev_list = nla_nest_start_noflag(reply, NBD_ATTR_DEVICE_LIST);
> +	if (!dev_list) {
> +		ret = -EMSGSIZE;
> +		goto out;
> +	}
> +
>  	if (index == -1) {
>  		ret = idr_for_each(&nbd_index_idr, &status_cb, reply);
>  		if (ret) {
> 

Looks good to me.
Reviewed-by: Bob Liu <bob.liu@oracle.com>

