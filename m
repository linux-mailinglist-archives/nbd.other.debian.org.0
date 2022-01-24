Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BAB4978CB
	for <lists+nbd@lfdr.de>; Mon, 24 Jan 2022 07:08:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7721A205E9; Mon, 24 Jan 2022 06:08:57 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jan 24 06:08:57 2022
Old-Return-Path: <manfred@colorfullife.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,LDOSUBSCRIBER,LDO_WHITELIST,MD5_SHA1_SUM,NICE_REPLY_A,
	RCVD_IN_DNSWL_NONE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DDF01205E6
	for <lists-other-nbd@bendel.debian.org>; Mon, 24 Jan 2022 06:08:47 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.501 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, BODY_8BITS=1.5, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, LDO_WHITELIST=-5, MD5_SHA1_SUM=-1,
	NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 0orpS9k5FBMw for <lists-other-nbd@bendel.debian.org>;
	Mon, 24 Jan 2022 06:08:44 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 4ED1A205C9
	for <nbd@other.debian.org>; Mon, 24 Jan 2022 06:08:44 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id i2so11490749wrb.12
        for <nbd@other.debian.org>; Sun, 23 Jan 2022 22:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=OGa1PT0bn5LLAzPE/rMH5bKugf+iLqpj40IhlVONKMI=;
        b=PAVtJyxjpPspeoGkPXxX9imLN8L3QoTTt7zHh/5QdW2s3ZjpTQB0iYtMAZ/mGyazFo
         mQyi7cQnUN/akz+Lzeta4mpbsh3XJ7MiGgJGhnVmTiDm7301npJabeEKw2KrgpgG4AEJ
         oSk5g2SvqMN8hKlRqmlBsPp3m0iyoek8Un4613jBMai57E3r36QVGRq1Bmu8N4MgM+/c
         +fq+UJ2vCwmN29zS3HHt3Kh2woP5MGlVXv3vCcNnnJsOjXEnDtYIxrxhV7nB8eZQ9pYF
         /J/wfhGN0wur/M1VGXrgvv6LefuaF1+sQ37ELMWH1ymS9gQfpisN3jpS658+xArxh/aK
         S32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OGa1PT0bn5LLAzPE/rMH5bKugf+iLqpj40IhlVONKMI=;
        b=6Z6G88vlJ5SgmPZi63UAQl2Z61Ib+zHBNYN/lfSDJDAXHK/4V4SpYdiiN4Yh2cG7Aj
         wyV7ywJwNwcL/qHxphsv1d8cD5L3zu52q/SUT/7jBK7238PL+M1kS1WhigfJu+JD8oeh
         nkCZKGmMG28FfFXk3gASQSIbLxTp8jM7fa4T80BMWtOwKBLh2cgnxFfpCxXK3kblQjNz
         hJzjkaV07QJ3ihlfVynG+avSOxmItX3bAuzJVG6UNwwBaHRUa1WVyqspbiu+tNkqYYiv
         8HOdnt1H48lzbpSTRzugF15WRmmi7zW3Vwq9ThFwKRKtBSO3JbmhXjDbeCpP33GVNYVB
         3MDw==
X-Gm-Message-State: AOAM5313MtZKpFoSNtdw9/xl5ptKvj/xYKP67K7FET5hpBlMjyDx/PTG
	KaQFR1NY0BFpcebtgHaysveC4Lem4Bi1NA==
X-Google-Smtp-Source: ABdhPJwM6hcjsnsfZZag4P7MM7t4CKMFAzFMuJUcBzyRJllIYHdU1N1/C6cZvTzjpOHYAPPTAmq2zQ==
X-Received: by 2002:adf:ef4f:: with SMTP id c15mr8003424wrp.63.1643004521168;
        Sun, 23 Jan 2022 22:08:41 -0800 (PST)
Received: from ?IPV6:2003:d9:9706:c900:437b:2364:740d:b3ae? (p200300d99706c900437b2364740db3ae.dip0.t-ipconnect.de. [2003:d9:9706:c900:437b:2364:740d:b3ae])
        by smtp.googlemail.com with ESMTPSA id k12sm6687442wrd.110.2022.01.23.22.08.40
        for <nbd@other.debian.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jan 2022 22:08:40 -0800 (PST)
Message-ID: <d9df9c1f-e9ec-1aa5-0baf-3004b24be5d6@colorfullife.com>
Date: Mon, 24 Jan 2022 07:08:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: report security problem of nbd
Content-Language: en-US
To: nbd@other.debian.org
References: <CAFfU0HAYyuiuvVDe622zP7OLXDYRftrYzvYjeRxgLaKoq2E0+A@mail.gmail.com>
From: Manfred Spraul <manfred@colorfullife.com>
In-Reply-To: <CAFfU0HAYyuiuvVDe622zP7OLXDYRftrYzvYjeRxgLaKoq2E0+A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <FdxMh0OMjBK.A.OQD.5Jk7hB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1705
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/d9df9c1f-e9ec-1aa5-0baf-3004b24be5d6@colorfullife.com
Resent-Date: Mon, 24 Jan 2022 06:08:57 +0000 (UTC)

Hi Wangduo,

On 1/24/22 05:10, 王多 wrote:
> 1.stack overflow
> In nbd-server.c, function handle_info have a stack overflow
>
> https://github.com/NetworkBlockDevice/nbd/blob/5750003711b8050bad3ddaf5196201ef419ce15d/nbd-server.c#L2299
>
> len can be controlled by an attacker, the buf size is 1024, when `len 
> - sizeof(namelen) > 1024` the buf overflow.
>
[...]

Would something like this be a suitable fix?

<<<

> --- a/nbd-server.c
> +++ b/nbd-server.c
> @@ -2356,6 +2356,12 @@static bool handle_info(CLIENT* client, uint32_t 
> opt, GArray* servers, uint32_t
>
>        socket_read(client, &len, sizeof(len));
>        len = htonl(len);
> +if (len > sizeof(buf)) {
> +consume(client, len, buf, sizeof(buf));
> +
> +send_reply(client, opt, NBD_REP_ERR_POLICY, -1, "Access denied by 
> server configuration");
> +return false;
> +}
>        socket_read(client, &namelen, sizeof(namelen));
>        namelen = htonl(namelen);
>        if(namelen > (len - 6)) {
>
(untested, and obviously the error message is wrong)

 >>>

>
> 2.heap overflow
> In nbd-server.c, function handle_info and handle_export_name have a 
> heap overflow
>
> https://github.com/NetworkBlockDevice/nbd/blob/5750003711b8050bad3ddaf5196201ef419ce15d/nbd-server.c#L2302
> https://github.com/NetworkBlockDevice/nbd/blob/5750003711b8050bad3ddaf5196201ef419ce15d/nbd-server.c#L2117
>
> namelen can be controlled by an attacker, when `namelen = -1`,  malloc 
> will allocate a very small buffer, but socket_read will read a 
> 0xffffffff, thus causing a heap overflow
>
The pattern is identical: Should we consume the user sent data, and then 
fail?

Or should we perform a hard disconnect the connection if namelen is e.g. 
 > INT_MAX?

--

     Manfred

