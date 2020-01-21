Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CB0143F7D
	for <lists+nbd@lfdr.de>; Tue, 21 Jan 2020 15:27:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BD93220426; Tue, 21 Jan 2020 14:27:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jan 21 14:27:08 2020
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,FOURLA,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5C43C20457
	for <lists-other-nbd@bendel.debian.org>; Tue, 21 Jan 2020 14:09:37 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.9 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id zRG-K0FyyzZ5 for <lists-other-nbd@bendel.debian.org>;
	Tue, 21 Jan 2020 14:09:31 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qk1-x742.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id B606620456
	for <nbd@other.debian.org>; Tue, 21 Jan 2020 14:09:31 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id d71so2810396qkc.0
        for <nbd@other.debian.org>; Tue, 21 Jan 2020 06:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MXMAlZrf6RWqgu1sZHLz9u+/Sa6aM/FrrOMx7Y5CS+U=;
        b=U0aT5pb5FoHZj5lISYTKH5SvegT1CwAlwWnXDVcU6MVD4WJMBL4/fWmH1qaQ2YSwUV
         eUXDAKu0ADfvrB0kuVG3ZhJ0AFq553As9ukd2UrMxzPtIK+LiURUpvHSl4wYJIKZLBZ5
         WMwphxiW4auh9oesjHPDimGLxo8R9n5B0fbppZnIpAFIXoR3uJjUew7y4/89ys4+beRZ
         QkR7UWQNR0zBXPk/LXNixzs7s7gxbAsWgNl9mMzREHTzbL9lrXbV8PbBvAg1vqP4sr8/
         fiTKtismOtboFx20pNHqT6F4HVs5/5aEcnHto8mWtBPrHQfh/bp8eMbnR7b94ejl/g3z
         KTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MXMAlZrf6RWqgu1sZHLz9u+/Sa6aM/FrrOMx7Y5CS+U=;
        b=bmDXbE3gyRjGiYpg8ZYmwDTNghoKMWaRsJz4rptfKGGsuhoNYEf2oMElfXUeENSqHO
         eIr4hQdiPBXRCfCurVll4WPHM5yNu2T746pD4+eeXGq2I5EufKhRpVDD6Pm4FDBG86Mc
         3DS3yabZS54UBR81jzPDNErezKUOGsVeTt3lzMUD4do4ROMVI4JbxlK0T9ENXWAWR4Hb
         3hdpFzP8slPjesolGcPpeQNweGAe6MXJK319zAzeVb8Sb+QypDuokwtCzNwaYjl86WC8
         A/TtmZgKwv8Zb4+xKJeuNL4zzVKsnxO+FkBeo63WU4tIo3Cl6Z02q7a4fxoMhiFgiWGi
         qP8w==
X-Gm-Message-State: APjAAAXBMZz4iEZ7tboxnd1JbDagye3eqWiATxlpuf+SjtZjdl2tPtsr
	+NwbuQ3GQqqoWEjwsWIURMmjRQ==
X-Google-Smtp-Source: APXvYqzbepHCf8odvOuFZORhg4stdqBChkK/lRhRxCuHcOGffbvJ/jV9yysnaPWYPxVgZaBof9w8Sw==
X-Received: by 2002:a37:b783:: with SMTP id h125mr4507737qkf.75.1579615768137;
        Tue, 21 Jan 2020 06:09:28 -0800 (PST)
Received: from ?IPv6:2620:10d:c0a8:1102:ce0:3629:8daa:1271? ([2620:10d:c091:480::822a])
        by smtp.gmail.com with ESMTPSA id r28sm19712087qtr.3.2020.01.21.06.09.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2020 06:09:27 -0800 (PST)
Subject: Re: [v2] nbd: fix potential NULL pointer fault in nbd_genl_disconnect
To: Sun Ke <sunke32@huawei.com>, axboe@kernel.dk, mchristi@redhat.com
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org
References: <20200120124549.27648-1-sunke32@huawei.com>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <8bb961fe-3412-9c3c-ad9b-54d446e90bf0@toxicpanda.com>
Date: Tue, 21 Jan 2020 09:09:26 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200120124549.27648-1-sunke32@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Jul2tDK3d0.A.M7C.8owJeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/778
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/8bb961fe-3412-9c3c-ad9b-54d446e90bf0@toxicpanda.com
Resent-Date: Tue, 21 Jan 2020 14:27:08 +0000 (UTC)

On 1/20/20 7:45 AM, Sun Ke wrote:
> Open /dev/nbdX first, the config_refs will be 1 and
> the pointers in nbd_device are still null. Disconnect
> /dev/nbdX, then reference a null recv_workq. The
> protection by config_refs in nbd_genl_disconnect is useless.
> 
> To fix it, just add a check for a non null task_recv in
> nbd_genl_disconnect.
> 
> Signed-off-by: Sun Ke <sunke32@huawei.com>
> ---
> v1 -> v2:
> 
> add an omitted mutex_unlock.
> ---
>   drivers/block/nbd.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index b4607dd96185..668bc9cb92ed 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -2008,6 +2008,10 @@ static int nbd_genl_disconnect(struct sk_buff *skb, struct genl_info *info)
>   		       index);
>   		return -EINVAL;
>   	}
> +	if (!nbd->task_recv) {
> +		mutex_unlock(&nbd_index_mutex);
> +		return -EINVAL;
> +	}
>   	if (!refcount_inc_not_zero(&nbd->refs)) {
>   		mutex_unlock(&nbd_index_mutex);
>   		printk(KERN_ERR "nbd: device at index %d is going down\n",
> 

This doesn't even really protect us, we need to have the nbd->config_lock held 
here to make sure it's ok.  The IOCTL path is safe because it creates the device 
on open so it's sure to exist by the time we get to the disconnect, we don't 
have that for genl_disconnect.  So I'd add the config_mutex before getting the 
config_ref, and then do the check, something like

mutex_lock(&nbd->config_lock);
if (!refcount_inc_not_zero(&nbd->refs)) {
}
if (!nbd->recv_workq) {
}
mutex_unlock(&nbd->config_lock);

Thanks,

Josef

