Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 207AD10298A
	for <lists+nbd@lfdr.de>; Tue, 19 Nov 2019 17:39:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E2E8B2090B; Tue, 19 Nov 2019 16:39:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Nov 19 16:39:08 2019
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VERIFIED,FOURLA,RCVD_IN_DNSWL_NONE,TO_TOO_MANY
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E8944208AA
	for <lists-other-nbd@bendel.debian.org>; Tue, 19 Nov 2019 16:24:00 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.1 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, RCVD_IN_DNSWL_NONE=-0.0001,
	TO_TOO_MANY=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id v2mvBYh2WhzI for <lists-other-nbd@bendel.debian.org>;
	Tue, 19 Nov 2019 16:23:56 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id E1E0C208A5
	for <nbd@other.debian.org>; Tue, 19 Nov 2019 16:23:55 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id i13so23910205ioj.5
        for <nbd@other.debian.org>; Tue, 19 Nov 2019 08:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7xBPbB0l5zXDQJ0ykS2pcsoh3Vk0x6ZjZkqP5G3hnUM=;
        b=Sm8z1kApGq1YRmDHN+gWoe8jgDmvwDTCFFbiUOE1ZzL8UwxD3CHaIoj+U5vroJWotn
         Scut8GZMnc8ZVRAlIPwAPkDombOWJhIA00gLfMjNYwogATUHyj0IBnX8faNEHJg5o8ca
         gObf0a+uUbqjo+e6kg0rH3OXqyinmg1Rg8+uGrYDl2GhtmuOFwEm8YpOIyPpKPvfrFpb
         lIkft9nZX3+00p4t4ppCCYYsyrmw5CGl6t1i6z2UeK2K79X1yq33aKR0DkCeaKTCXlNS
         TceACMWTRkXkyzpznWBS38sjIeR0hM6kullpYZnPiDZ/0omJbyifVdCf7/AeK4ILPBdj
         meGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7xBPbB0l5zXDQJ0ykS2pcsoh3Vk0x6ZjZkqP5G3hnUM=;
        b=nbDySI3RBvVSoPs+lAX2C1ciJKQIjOjeKLA/EDEPE4jsenhip/cmYpGWJpjrYlfUVe
         cwXlaz7LAcBpt6VTTL1Bue2VzkWYDgAnAZaJR2ZU5hAgdHP+85DSBNIPN1EQGffsaQwm
         5dWJHBXUGbg6Oqm7msWWSroNSkoyp1Hk7lDrF+Drn7Jo0BUVRm0geq6BtMkggN3Eke84
         x9gUn9tUjBDkQuSKrdgGEoIMk0pCLS8c+CJaQxnoYcnHkpEyl0VuB0S5oUELNfYvjQbP
         gbIr4cOFHDAclchLSEY4DqBQDfSLaPzuPyWXfcjAOgdJOunHMre2kPtu0o22bxac+9+e
         6SRg==
X-Gm-Message-State: APjAAAX8Ocq+qAFbOFTSN4e0TEjZJQbMt/M/piZDos2nWuWLEtjNkkQL
	tg6MVXfra/+vRi0eEqk7TXCgaA==
X-Google-Smtp-Source: APXvYqz/gjRUdkRFVh4ufDotsnWFDqpbvx2ZHAFudSc3izo4sM/ESTDEoM2N3Z6rLIWo+SHS9cyzig==
X-Received: by 2002:a02:40c6:: with SMTP id n189mr430847jaa.18.1574180632196;
        Tue, 19 Nov 2019 08:23:52 -0800 (PST)
Received: from [192.168.1.159] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id y8sm5611174ilg.47.2019.11.19.08.23.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Nov 2019 08:23:51 -0800 (PST)
Subject: Re: [v2] nbd:fix memory leak in nbd_get_socket()
To: Mike Christie <mchristi@redhat.com>, Sun Ke <sunke32@huawei.com>,
 josef@toxicpanda.com, linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <1574143751-138680-1-git-send-email-sunke32@huawei.com>
 <5DD416DB.1040302@redhat.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <e7d5d08c-c8d6-cd22-ba0a-e53ab08ea5d8@kernel.dk>
Date: Tue, 19 Nov 2019 09:23:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5DD416DB.1040302@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <z--JexBNetC.A.RGC.sqB1dB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/742
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/e7d5d08c-c8d6-cd22-ba0a-e53ab08ea5d8@kernel.dk
Resent-Date: Tue, 19 Nov 2019 16:39:08 +0000 (UTC)

On 11/19/19 9:22 AM, Mike Christie wrote:
> On 11/19/2019 12:09 AM, Sun Ke wrote:
>> Before return NULL,put the sock first.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: cf1b2326b734 ("nbd: verify socket is supported during setup")
>> Signed-off-by: Sun Ke <sunke32@huawei.com>
>> ---
>> v2: add cc:stable tag
>> ---
>>   drivers/block/nbd.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
>> index a94ee45..19e7599 100644
>> --- a/drivers/block/nbd.c
>> +++ b/drivers/block/nbd.c
>> @@ -993,6 +993,7 @@ static struct socket *nbd_get_socket(struct nbd_device *nbd, unsigned long fd,
>>   	if (sock->ops->shutdown == sock_no_shutdown) {
>>   		dev_err(disk_to_dev(nbd->disk), "Unsupported socket: shutdown callout must be supported.\n");
>>   		*err = -EINVAL;
>> +		sockfd_put(sock);
>>   		return NULL;
>>   	}
>>   
>>
> 
> Reviewed-by: Mike Christie <mchristi@redhat.com>

Thanks (both of you), applied for 5.4.

-- 
Jens Axboe

