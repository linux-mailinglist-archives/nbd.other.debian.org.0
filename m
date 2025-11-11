Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id E2923C4E8E0
	for <lists+nbd@lfdr.de>; Tue, 11 Nov 2025 15:45:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B292F20498; Tue, 11 Nov 2025 14:45:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Nov 11 14:45:12 2025
Old-Return-Path: <yukuai@fnnas.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,FOURLA,
	MSGID_FROM_MTA_HEADER,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id BF070204B8
	for <lists-other-nbd@bendel.debian.org>; Tue, 11 Nov 2025 14:27:08 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.102 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, FOURLA=0.1,
	MSGID_FROM_MTA_HEADER=3, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
	RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id HsRmIjMEy3tD for <lists-other-nbd@bendel.debian.org>;
	Tue, 11 Nov 2025 14:27:01 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .fnnas. - helo: .sg-1-19.ptr.blmpb. - helo-domain: .blmpb.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
X-Greylist: delayed 1227 seconds by postgrey-1.36 at bendel; Tue, 11 Nov 2025 14:27:01 UTC
Received: from sg-1-19.ptr.blmpb.com (sg-1-19.ptr.blmpb.com [118.26.132.19])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 4AF87204A2
	for <nbd@other.debian.org>; Tue, 11 Nov 2025 14:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fnnas-com.20200927.dkim.feishu.cn; t=1762869671;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=HeiFAq8m+pszRxKRkfLlU5b+dRr3M5cAVbg7a9AKRAQ=;
 b=E9q1R7m6aC5YtNLfiZz3FSZOPhdCjXkg1NmduFrYFrhpM2aU3friK460i1qCoQHl5ZrQFT
 B0HlnbwKFGC897fig330b31fmXu1ZjTn4I2h2CbEnzJifNBoSM1j+Oe5CsbwP6siZd8Y9L
 k9DIxo4j1OY0YBmtoxK38M/R3S3odgSRaptr4+uFuI+rUXkWuABSxqMDZM05lG8R26LLG0
 3gvUTHLjtI/fy2oSRMOFY688I0oyvPyIhJeV739/r2ynEL1MDaFTZRO1ggSr3jR29CF2lU
 XtzJ0ROeKXicG3PXPvpvCqogCuI3/eWn5dreUQv1AUqktYGQ5e7ZgF2S8sSNfA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110124920.1333561-1-zhengqixing@huaweicloud.com>
References: <20251110124920.1333561-1-zhengqixing@huaweicloud.com>
X-Original-From: Yu Kuai <yukuai@fnnas.com>
Reply-To: yukuai@fnnas.com
Date: Tue, 11 Nov 2025 22:01:05 +0800
Message-Id: <49872d86-3867-41eb-916e-4debf463cc60@fnnas.com>
Organization: fnnas
Received: from [192.168.1.104] ([39.182.0.168]) by smtp.feishu.cn with ESMTPS; Tue, 11 Nov 2025 22:01:09 +0800
User-Agent: Mozilla Thunderbird
X-Lms-Return-Path: <lba+2691341a5+893aec+other.debian.org+yukuai@fnnas.com>
Content-Type: text/plain; charset=UTF-8
To: "Zheng Qixing" <zhengqixing@huaweicloud.com>, <josef@toxicpanda.com>, 
	<axboe@kernel.dk>
Cc: <linux-block@vger.kernel.org>, <nbd@other.debian.org>, 
	<linux-kernel@vger.kernel.org>, <yi.zhang@huawei.com>, 
	<yangerkun@huawei.com>, <houtao1@huawei.com>, <zhengqixing@huawei.com>
From: "Yu Kuai" <yukuai@fnnas.com>
Subject: Re: [PATCH] nbd: defer config unlock in nbd_genl_connect
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <oTWM_3MgqrL.A.HGED.4v0EpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3471
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/49872d86-3867-41eb-916e-4debf463cc60@fnnas.com
Resent-Date: Tue, 11 Nov 2025 14:45:12 +0000 (UTC)

=E5=9C=A8 2025/11/10 20:49, Zheng Qixing =E5=86=99=E9=81=93:

> There is one use-after-free warning when running NBD_CMD_CONNECT and
> NBD_CLEAR_SOCK:
>
> nbd_genl_connect
>    nbd_alloc_and_init_config // config_refs=3D1
>    nbd_start_device // config_refs=3D2
>    set NBD_RT_HAS_CONFIG_REF			open nbd // config_refs=3D3
>    recv_work done // config_refs=3D2
> 						NBD_CLEAR_SOCK // config_refs=3D1
> 						close nbd // config_refs=3D0
>    refcount_inc -> uaf
>
> ------------[ cut here ]------------
> refcount_t: addition on 0; use-after-free.
> WARNING: CPU: 24 PID: 1014 at lib/refcount.c:25 refcount_warn_saturate+0x=
12e/0x290
>   nbd_genl_connect+0x16d0/0x1ab0
>   genl_family_rcv_msg_doit+0x1f3/0x310
>   genl_rcv_msg+0x44a/0x790
>
> The issue can be easily reproduced by adding a small delay before
> refcount_inc(&nbd->config_refs) in nbd_genl_connect():
>
>          mutex_unlock(&nbd->config_lock);
>          if (!ret) {
>                  set_bit(NBD_RT_HAS_CONFIG_REF, &config->runtime_flags);
> +               printk("before sleep\n");
> +               mdelay(5 * 1000);
> +               printk("after sleep\n");
>                  refcount_inc(&nbd->config_refs);
>                  nbd_connect_reply(info, nbd->index);
>          }
>
> Fixes: e46c7287b1c2 ("nbd: add a basic netlink interface")
> Signed-off-by: Zheng Qixing<zhengqixing@huawei.com>
> ---
>   drivers/block/nbd.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

LGTM
Reviewed-by: Yu Kuai <yukuai@fnnas.com>

